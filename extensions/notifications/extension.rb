#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
module BeEF
  module Extension
    module Notifications
      extend BeEF::API::Extension

      @short_name = 'notifications'
      @full_name = 'Notifications'
      @description = 'Generates external notifications for events in BeEF'
    end
  end
end

require 'extensions/notifications/notifications'
