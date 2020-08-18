require 'logger'
require 'test/unit'
require 'rubygems'
require_relative '../commons/webdriver_manager.rb'
include WebDriver
require_relative '../commons/read_yaml_file.rb'
include ReadYamlFile
require_relative '../page_objects/home_page.rb'
include HomePage
require_relative '../commons/common.rb'

$logger = Logger.new(STDOUT)

class Test_One < Test::Unit::TestCase
  

  #
  # The set up method for each test
  #
  def setup()
    $driver = WebDriver.browser
    $common = Common.new($driver)
    HomePage.open_home_page($driver)
  end
  

  #
  # tests go here
  #
  test 'test_1' do
    type_stuff_in_field("TestingBot - Google Search")
    $common.check_condition($driver.title != "", $driver, "test_1 failed")
  end

  #
  # The tear down method for each test
  #
  def teardown()
    $logger.info("Quitting driver")
    $driver.quit
  end

end