require_relative '../commons/webdriver_manager.rb'
include WebDriver
require_relative '../commons/read_yaml_file.rb'
include ReadYamlFile
require 'logger'

$logger = Logger.new(STDOUT)
module HomePage

    def open_home_page()
        url = ReadYamlFile.get_url
        driver = WebDriver.browser
        $logger.info("Opening the browser " )
        driver.get(url)
        $logger.info("Opening the home page of: " + url)
    end

end