require 'logger'
require 'rubygems'
require 'webdrivers'
require "selenium-webdriver"
require 'rbconfig'

require_relative 'read_yaml_file.rb'
include ReadYamlFile

$logger = Logger.new(STDOUT)
$browser = ReadYamlFile.get_browser()
$browser_stack = ReadYamlFile.get_config("browser_stack")
$headless = ReadYamlFile.get_config("headless")

#
# This module controls selenium
#
module WebDriver

  #
  # Browser method will return the correct browser with the operating system
  # If no browser is detected a default will run
  #
    def browser()
        begin
        if $browser_stack == true
          browser_stack() 

        elsif is_mac() 
          mac_driver()

        elsif is_windows()
          windows_driver()

        elsif is_linux()
          linux_driver()
        end
    end
  end

  #
  # This method is used if the .yaml file has browser_stack = true
  #
  def browser_stack()
    $logger.info("browserstack has been detected")
          caps = Selenium::WebDriver::Remote::Capabilities.new           
          caps['browser'] = ReadYamlFile.get_config("remote_browser")
          caps['os_version'] = ReadYamlFile.get_config("os_version")
          caps['resolution'] = ReadYamlFile.get_config("resolution")
          caps['os'] = ReadYamlFile.get_config("OS X")
          caps['browser_version'] = ReadYamlFile.get_config("browser_version")
          caps["name"] = ReadYamlFile.get_config("name")
          username = ReadYamlFile.get_config("user_name")
          access_key = ReadYamlFile.get_config("access_key")
          
          driver = Selenium::WebDriver.for(:remote,
            :url => "https://" + username + ":" + access_key + "@hub-cloud.browserstack.com/wd/hub",
            :desired_capabilities => caps)
  end

  #
  # This asserts if the operating system is a mac
  #
  def is_mac()
    RbConfig::CONFIG['host_os'] =~ /|darwin|/i
    $logger.info("Mac os has been detected")
  end

  #
  # This method is used if the OS system is Mac
  #
  def mac_driver()
  begin
    if ($headless == true and $browser == "chrome")
      mac_headless_chrome_browser()

    elsif ($headless == true and $browser == "firefox")
      mac_headless_firefox_browser()

    elsif $browser == "chrome"
      mac_chrome_browser()

    elsif $browser == "firefox"
      mac_fire_fox_browser()
    end

    rescue Selenium::WebDriver::Error::WebDriverError => wde
      mac_default_browser()
    end
  end

  #
  # mac_driver will call mac_chrome_browser() if chrome has been detected
  #
  def mac_chrome_browser()
      $logger.info($browser + " has been detected")
      Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/chromedriver"
      driver = Selenium::WebDriver.for :chrome
  end

  #
  # mac_driver will call mac_chrome_browser() if chrome has been detected
  # and if headless has been detected
  #

  def mac_headless_chrome_browser()
    $logger.info("Headless " + $browser + " has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/chromedriver"
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    driver = Selenium::WebDriver.for(:chrome, options: options)
  end

  #
  # mac_driver will call mac_fire_fox_browser() if firefox has been detected
  #
  def mac_fire_fox_browser()
    $logger.info($browser + " has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/geckodriver"
    driver = Selenium::WebDriver.for :firefox
  end

  #
  # mac_driver will call mac_headless_firefox_browser() if firefox has been detected
  # and if headless has been detected
  #

  def mac_headless_firefox_browser()
    $logger.info("Headless " + $browser + " has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/chromedriver"
    options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
    driver = Selenium::WebDriver.for :firefox, options: options
  end

  #
  # mac_driver will call mac_default_driver() if no driver has been detected
  #
  def mac_default_browser()
    $logger.info("No driver detected default mac driver launched")
    $logger.info("chrome has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/chromedriver"
    driver = Selenium::WebDriver.for :chrome
  end

  #
  # This asserts if the operating system is a windows
  #
  def is_windows()
    RbConfig::CONFIG['host_os'] =~ /mswin32/i
    $logger.info("Windows os has been detected")
  end

  #
  # This method is used if the OS system is Windows
  #
  def windows_driver()
    begin
      if $browser == "chrome"
        windows_chrome_browser()
      elsif $browser == "firefox"
        windows_firefox_browser()
      end

    rescue Selenium::WebDriver::Error::WebDriverError => wde
      windows_default_browser()
    end
  end

  #
  # windows_driver will call windows_chrome_browser() if chrome has been detected
  #
  def windows_chrome_browser()
    $logger.info($browser + " has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources//windows_drivers_32//chromedriver.exe"
    driver = Selenium::WebDriver.for :chrome
  end

  #
  # windows_driver will call windows_firefox_browser() if chrome has been detected
  #
  def windows_firefox_browser()
    $logger.info($browser + " has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources//windows_drivers_32//geckodriver.exe"
    driver = Selenium::WebDriver.for :firefox
  end

  #
  # windows_driver will call windows_default_browser() if no driver has been detected
  #
  def windows_default_browser()
    $logger.info("No driver detected default windows driver launched")
    $logger.info("chrome has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources//windows_drivers_32//chromedriver.exe"
    driver = Selenium::WebDriver.for :chrome
  end

  #
  # This asserts if the operating system is a linux
  #
  def is_linux()
    RbConfig::CONFIG['host_os'] =~ /linux/i
    $logger.info("Linux os has been detected")
  end

  #
  # This method is used if the OS system is a linux
  #
  def linux_driver()
    begin
      if $browser == "chrome"
        linux_chrome_browser()
      elsif $browser == "firefox"
        linux_fire_fox_browser()
      end

    rescue Selenium::WebDriver::Error::WebDriverError => wde
      linux_default_browser()
    end
  end

  #
  # linux_driver will call linux_chrome_browser() if chrome has been detected
  #
  def linux_chrome_browser()
    $logger.info($browser + " has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources/linux_drivers/chromedriver"
    driver = Selenium::WebDriver.for :chrome
  end

  #
  # linux_driver will call linux_fire_fox_browser() if firefox has been detected
  #
  def linux_fire_fox_browser()
    $logger.info($browser + " has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources/linux_drivers/geckodriver"
    driver = Selenium::WebDriver.for :firefox
  end

  #
  # linux_driver will call linux_default_browser() if no driver has been detected
  #
  def linux_default_browser()
    $logger.info("No driver detected default linux driver launched")
    $logger.info("chrome has been detected")
    Selenium::WebDriver::Chrome::Service.driver_path = "../resources/linux_drivers/chromedriver"
    driver = Selenium::WebDriver.for :chrome
  end

  #
  # This method is used if there are any errors
  # It will launch default drivers
  # This is a all else fail safe
  #
  def default_driver_if_error()
      $logger.info(
        "There is a problem with your properties.yaml or driver file path\n
        No driver detected default driver launched\n
        chrome has been detected.\n
        Major driver issue.... default_driver_if_error() has been called")
      Selenium::WebDriver::Chrome::Service.driver_path = "../resources/mac_drivers/chromedriver"
      driver = Selenium::WebDriver.for :chrome
  end
end