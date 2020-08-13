require 'logger'
require 'rubygems'
require 'webdrivers'
require "selenium-webdriver"

require_relative "read_yaml_file.rb"
include ReadYamlFile

$logger = Logger.new(STDOUT)
$browser = ReadYamlFile.get_browser


module WebDriver
        def browser()
            if $browser == nil
                $logger.info("browserstack has been detected")
                caps = Selenium::WebDriver::Remote::Capabilities.new
                caps['browser'] = ReadYamlFile.get_remote_browser()
                caps['os_version'] = ReadYamlFile.get_os_version()
                caps['resolution'] = ReadYamlFile.get_resolution()
                caps['os'] = ReadYamlFile.get_os()
                caps['browser_version'] = ReadYamlFile.get_browser_version()
                caps["name"] = ReadYamlFile.get_test_name()
                username = ReadYamlFile.get_user_name()
                access_key = ReadYamlFile.get_password()
                
                driver = Selenium::WebDriver.for(:remote,
                    :url => "https://" + username + ":" + access_key + "@hub-cloud.browserstack.com/wd/hub",
                    :desired_capabilities => caps)

            elsif $browser.downcase() == "chrome"
                $logger.info("chrome has been detected")
                Selenium::WebDriver::Chrome::Service.driver_path= "resources/mac_drivers/chromedriver"
                driver = Selenium::WebDriver.for :chrome
            elsif $browser.downcase() == "firefox"
                $logger.info("firefox has been detected")
                Selenium::WebDriver::Chrome::Service.driver_path= "resources/mac_drivers/geckodriver"
                driver = Selenium::WebDriver.for :firefox

        end
        
    end
end