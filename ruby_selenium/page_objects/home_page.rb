require_relative '../commons/webdriver_manager.rb'
include WebDriver
require_relative '../commons/read_yaml_file.rb'
include ReadYamlFile
require 'logger'

$logger = Logger.new(STDOUT)

#
# This is the home page of the page_objects section
#
module HomePage

  #
  # All WebElements are listed below in hashmaps
  #
  $search_bar = {:name => 'q'}

  #
  # This will open the home page of our app
  #
  def open_home_page(driver)
    url = ReadYamlFile.get_config("url")
    $logger.info("Opening the browser " )
    driver.get(url)
    $logger.info("Opening the home page of: " + url)
  end

  #
  # Start of the home page objects
  #
  def type_stuff_in_field(string)
    $common.click_button($driver, $search_bar, 1)
    $common.send_keys_to_field($driver, $search_bar, 1, string)
    $common.enter($driver, $search_bar, 1)
  end
end