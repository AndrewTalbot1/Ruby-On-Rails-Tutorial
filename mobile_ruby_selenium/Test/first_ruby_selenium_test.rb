require 'logger'
require 'test/unit'
require 'rubygems'
require_relative '../commons/appium_driver_manager.rb'
include WebDriver
require_relative '../commons/read_yaml_file.rb'
include ReadYamlFile
require_relative '../page_objects/home_page.rb'
include HomePage
require_relative '../commons/common.rb'

$logger = Logger.new(STDOUT)

class Test_One < Test::Unit::TestCase
  
  #
  # All WebElements are listed below in hashmaps
  #
  search_bar = {:name => 'q'}

  #
  # The set up method for each test
  #
  def setup()
    $driver = WebDriver.browser
    $common = Common.new($driver)
    # HomePage.open_home_page($driver)ls
  end
  

  #
  # tests go here
  #
  test 'test_1' do
  #   $common.click_button($driver, search_bar)
  #   $common.send_keys_to_field($driver, search_bar, "TestingBot")
  #   $common.enter($driver, search_bar)
  #   assert_equal($driver.title, "Google")
  end

  #
  # The tear down method for each test
  #
  def teardown()
    $logger.info("Quitting driver")
    $driver.quit
  end

end