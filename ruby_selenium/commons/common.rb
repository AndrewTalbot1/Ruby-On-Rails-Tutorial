require_relative '../commons/webdriver_manager.rb'
include WebDriver
require_relative '../commons/read_yaml_file.rb'
include ReadYamlFile
require 'logger'

$logger = Logger.new(STDOUT)

class Common
  #
  # This Commons class contains all webdriver functionality
  #
  def initialize(driver)
      @driver = driver
  end

  #
  # Check if a condition is true or sends a fail message
  #
  def check_condition(condition, driver, failmessage)
    if (condition)
      $logger.info("Check condition is true")
      
    else
      $logger.info("Condition is false")
      $logger.info(failmessage)
      screen_shot(driver, failmessage)
      raise Exception.new failmessage
    end
  end

  #
  # Waits for an element to be visible or times out
  # If no element is visable it will log an exception
  def wait_for_element(driver,el,seconds)
    begin
      wait = Selenium::WebDriver::Wait.new(:timeout => seconds)
      element = wait.until { driver.find_element(el) }
      $logger.info("Element " + element.text() + " is visible")
      return true
    rescue => $exception
      $logger.info($exception)
      $logger.info("Element is NOT visible")
      return false
    end
  end

  #
  # Takes a screenshot if something fails and puts it in the resources file called screen_shots 
  # failmessage should be the test case for easier identification
  #
  def screen_shot(driver, failmessage)
    $logger.info("Taking a screen shot")
    driver.save_screenshot "../resources/screen_shots/#{Time.now.strftime("#{failmessage} %d_%m_%Y__%H_%M_%S")}.png"
  end

  #
  # Finds the element of a button
  # Throws an error if no element is visable
  #
  def click_button(driver, el, seconds)
    check_condition(wait_for_element(driver, el, seconds), driver, "Couldn't click on the button")
      $logger.info("Clicking on button " + el.to_s)
      element = driver.find_element(el)
      element.click
  end

  #
  #Finds the element of a field to send text to
  #Throws an error if no element is visable
  # 
  def send_keys_to_field(driver, el, seconds, text)
    check_condition(wait_for_element(driver, el, seconds), driver, "Couldn't send keys to field")
      $logger.info("Sending keys to " + el.to_s)
      element = driver.find_element(el)
      element.send_keys(text)  
  end

  #
  # Basic Submit style function
  #
  def enter(driver, el, seconds)
    check_condition(wait_for_element(driver, el, seconds), driver, "Couldn't press enter")
      $logger.info("Pressing the Enter key")
      element = driver.find_element(el)
      element.submit
  end

  
end