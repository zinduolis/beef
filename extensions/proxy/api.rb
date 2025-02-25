#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
module BeEF
  module Extension
    module Proxy
      module API
        module RegisterHttpHandler
          BeEF::API::Registrar.instance.register(BeEF::Extension::Proxy::API::RegisterHttpHandler, BeEF::API::Server, 'pre_http_start')
          BeEF::API::Registrar.instance.register(BeEF::Extension::Proxy::API::RegisterHttpHandler, BeEF::API::Server, 'mount_handler')

          def self.pre_http_start(http_hook_server)
            config = BeEF::Core::Configuration.instance
            Thread.new do
              http_hook_server.semaphore.synchronize do
                BeEF::Extension::Proxy::Proxy.new
              end
            end
          end

          def self.mount_handler(beef_server)
            beef_server.mount('/api/proxy', BeEF::Extension::Proxy::ProxyRest.new)
          end
        end
      end
    end
  end
end
