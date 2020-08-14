require_relative '../commons/webdriver_manager.rb'
include WebDriver
require_relative '../commons/read_yaml_file.rb'
include ReadYamlFile
require 'logger'
require_relative '../page_objects/home_page.rb'
include HomePage

$logger = Logger.new(STDOUT)

def set_up()
    HomePage.open_home_page()
    driver = WebDriver.browser
end


def tear_down()
    driver.quit
end




set_up()
elem = driver.find_element(:name, 'q')      #q is the namespace of searchbox element
elem.send_keys "Ruby Selenium Webdriver"    #send_keys method used to write text
elem.submit
tear_down()
