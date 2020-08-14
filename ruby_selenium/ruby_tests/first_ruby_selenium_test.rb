require_relative '../commons/webdriver_manager.rb'
include WebDriver
require_relative '../commons/read_yaml_file.rb'
include ReadYamlFile
require_relative '../page_objects/home_page.rb'
include HomePage
require_relative '../commons/common.rb'
require 'logger'

$logger = Logger.new(STDOUT)

class Test_One
  
  #
  # All WebElements are listed below in hashmaps
  #
  search_bar = {:name => 'q'}

  #
  # The set up  and tear down method for each test
  #
  def self.set_up()
    $driver = WebDriver.browser
    $common = Common.new($driver)
    HomePage.open_home_page($driver)
  end
  
  def self.tear_down()
    $driver.quit
  end

  #
  # The start of each test
  #
  set_up()
  $common.click_button($driver, search_bar)
  $common.send_keys_to_field($driver, search_bar, "Selenium Webdriver")
  $common.enter($driver, search_bar)
  tear_down()
end