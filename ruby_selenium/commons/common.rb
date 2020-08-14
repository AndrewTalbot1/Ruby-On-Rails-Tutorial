require_relative '../commons/webdriver_manager.rb'
include WebDriver
require_relative '../commons/read_yaml_file.rb'
include ReadYamlFile
require 'logger'

$logger = Logger.new(STDOUT)

class Common
  def initialize(driver)
      @driver = driver
  end
  
  #
  # Finds the element of a button
  # Throws an error if no element is visable
  #
  def click_button(driver, el)
    begin
      $logger.info("Clicking on button " + el.to_s)
      element = driver.find_element(el)
      element.click
    rescue Selenium::WebDriver::Error::NoSuchElementError => nsee
      $logger.info("There was no element found to click on")
      $logger.info("Closing driver down")
      driver.quit()
    end 
  end

  #
  # Finds the element of a field to send text to
  # Throws an error if no element is visable
  #
  def send_keys_to_field(driver, el, text)
    begin
      $logger.info("Sending keys to " + el.to_s)
      element = driver.find_element(el)
      element.send_keys(text)  
    rescue Selenium::WebDriver::Error::NoSuchElementError => nsee
      $logger.info("There was no element to send keys to")
      $logger.info("Closing driver down")
      driver.quit()
    end
  end

  #
  # Basic Submit style function
  #
  def enter(driver, el)
    begin
      $logger.info("Pressing the Enter key")
      element = driver.find_element(el)
      element.submit
    rescue Selenium::WebDriver::Error::NoSuchElementError => nsee
       $logger.info("There was no element to send keys to")
       $logger.info("Closing driver down")
       driver.quit()    
    end
  end

  
end