#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#

# Common lib for BeEF tests
require '../common/ts_common'

require 'capybara'
require 'capybara/rspec'
Capybara.run_server = false # we need to run our own BeEF server

require 'selenium-webdriver'

require './check_environment' # Basic log in and log out tests
require './tc_debug_modules' # RESTful API tests (as well as debug modules)
require './tc_login' # Basic log in and log out tests
require './tc_proxy' # Basic tests for Proxy extension
require './tc_network_rest' # Basic tests for Network extension RESTful API interface
require '../api/1333_auth_rate' # API rate testing issue #1333'

# Experimental extensions
#require './tc_dns_rest' # Basic tests for DNS RESTful API interface
#require './tc_webrtc_rest' # Basic tests for WebRTC extension
#require './tc_social_engineering_rest' # Basic tests for social engineering RESTful API interface

class TS_BeefIntegrationTests
  def self.suite

    suite = Test::Unit::TestSuite.new(name="BeEF Integration Test Suite")
    suite << TC_CheckEnvironment.suite
    suite << TC_Login.suite
    suite << TC_DebugModules.suite
    suite << TC_Proxy.suite
    suite << TC_NetworkRest.suite

    # issue raised
    suite << TC_1333_auth_rate.suite

    # Tests for experimental extensions
    #suite << TC_SocialEngineeringRest.suite
    #suite << TC_Jools.suite
    #suite << TC_DnsRest.suite
    #suite << TC_WebRTCRest.suite

    suite
  end
end

Test::Unit::UI::Console::TestRunner.run(TS_BeefIntegrationTests)
