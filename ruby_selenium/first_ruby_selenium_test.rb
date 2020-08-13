require_relative "commons/webdriver_manager.rb"
include WebDriver
require_relative "commons/read_yaml_file.rb"
include ReadYamlFile
require 'logger'

$logger = Logger.new(STDOUT)

url = ReadYamlFile.get_url
driver = WebDriver.browser
$logger.info("Opening the browser " )
driver.get(url)
$logger.info("Opening the url : " + url)

elem = driver.find_element(:name, 'q')      #q is the namespace of searchbox element
elem.send_keys "Ruby Selenium Webdriver"    #send_keys method used to write text
elem.submit

driver.quit