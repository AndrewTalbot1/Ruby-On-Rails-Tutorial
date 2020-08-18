require 'rubygems'
require 'appium_lib'
require 'logger'
require 'rubygems'
require 'webdrivers'
require "selenium-webdriver"
require 'rbconfig'

require_relative 'read_yaml_file.rb'
include ReadYamlFile

$logger = Logger.new(STDOUT)
$browser_stack = ReadYamlFile.run_browser_stack
$server = ReadYamlFile.get_server()
  
#
# Webdriver for Appium
#
module WebDriver

  #
  # If browser stack is detected it will use this method
  #

  def appium_driver_browser_stack()
    $logger.info("browserstack has been detected")
    caps = {}
    caps['build'] = ReadYamlFile.get_build_name()
    caps["name"] = ReadYamlFile.get_test_name()
    caps['project'] = ReadYamlFile.get_project_name()
    caps['device'] =  ReadYamlFile.get_device_name()
    caps['os_version'] = ReadYamlFile.get_os_version()
    username = ReadYamlFile.get_user_name()
    access_key = ReadYamlFile.get_password()

    caps['app'] = ReadYamlFile.get_app_location()
      
    appium_driver = Appium::Driver.new({
        'caps' => caps,
        'appium_lib' => {
            :server_url => "http://" + username +":" + access_key + "@hub-cloud.browserstack.com/wd/hub"
        }}, true)
    driver = appium_driver.start_driver

  end

  #
  # If a local connection is detected it will use a local driver
  # More set up is required with the appium server locally
  #
  def appium_driver_local()
    $logger.info("local appium driver has been detected")
    caps = {}
    caps['build'] = ReadYamlFile.get_build_name()
    caps["name"] = ReadYamlFile.get_test_name()
    caps['project'] = ReadYamlFile.get_project_name()
    caps['device'] =  ReadYamlFile.get_device_name()
    caps['os_version'] = ReadYamlFile.get_os_version()

    caps['app'] = ReadYamlFile.get_app_location_local()
    
      
    appium_driver = Appium::Driver.new({
        'caps' => caps,
        'appium_lib' => {
            :server_url => $server
        }}, true)
    driver = appium_driver.start_driver
  end

  #
  #
  #
  def browser()
    if $browser_stack == true
      appium_driver_browser_stack() 
    end
  end

end

