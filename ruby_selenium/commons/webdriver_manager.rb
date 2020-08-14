require 'logger'
require 'rubygems'
require 'webdrivers'
require "selenium-webdriver"
require 'rbconfig'

require_relative 'read_yaml_file.rb'
include ReadYamlFile

$logger = Logger.new(STDOUT)
$browser = ReadYamlFile.get_browser
$browser_stack = ReadYamlFile.run_browser_stack


module WebDriver
    def browser()
        begin
          puts $browser_stack
        if $browser_stack == true
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
        
        elsif RbConfig::CONFIG['host_os'] =~ /|darwin|/i
          $logger.info("Mac os has been detected")
          if $browser.downcase() == "chrome"
            $logger.info("chrome has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/chromedriver"
            driver = Selenium::WebDriver.for :chrome
          elsif $browser.downcase() == "firefox"
            $logger.info("firefox has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/geckodriver"
            driver = Selenium::WebDriver.for :firefox
          else
            $logger.info("No driver detected default driver launched")
            $logger.info("chrome has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/chromedriver"
            driver = Selenium::WebDriver.for :chrome
          end
        elsif RbConfig::CONFIG['host_os'] =~ /mswin32/i
          $logger.info("Windows os has been detected")
          if $browser.downcase() == "chrome"
            $logger.info("chrome has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources//windows_drivers_32//chromedriver.exe"
            driver = Selenium::WebDriver.for :chrome
          elsif $browser.downcase() == "firefox"
            $logger.info("firefox has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources//windows_drivers_32//geckodriver.exe"
            driver = Selenium::WebDriver.for :firefox
          else
            $logger.info("No driver detected default driver launched")
            $logger.info("chrome has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources//windows_drivers_32//chromedriver.exe"
            driver = Selenium::WebDriver.for :chrome
          end
        elsif RbConfig::CONFIG['host_os'] =~ /linux/i
          $logger.info("Linux os has been detected")
          if $browser.downcase() == "chrome"
            $logger.info("chrome has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources/linux_drivers/chromedriver"
            driver = Selenium::WebDriver.for :chrome
          elsif $browser.downcase() == "firefox"
            $logger.info("firefox has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources/linux_drivers/geckodriver"
            driver = Selenium::WebDriver.for :firefox
          else
            $logger.info("No driver detected default driver launched")
            $logger.info("chrome has been detected")
            Selenium::WebDriver::Chrome::Service.driver_path = "../resources/linux_drivers/chromedriver"
            driver = Selenium::WebDriver.for :chrome
          end
        end
    rescue Selenium::WebDriver::Error::WebDriverError => wde
      $logger.info(wde)
      $logger.info("There is a problem with your properties.yaml")
      $logger.info("No driver detected default driver launched")
      $logger.info("chrome has been detected")
      Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/chromedriver"
      driver = Selenium::WebDriver.for :chrome
    end
  end
end