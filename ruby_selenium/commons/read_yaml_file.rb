require 'logger'
$logger = Logger.new(STDOUT)

#
# This module reads the key and value in the .yaml file
#
module ReadYamlFile
    require 'yaml'
    $config = YAML.load_file("../resources/properties.yaml")
    
    #
    # Pass a string KEY and it will return a value
    #
    def get_config(string)  
      if $config[string] != nil
        return $config[string]
      end
    end

    #
    # Returns the value of the .yaml browser type
    #
    def get_browser()
      if $browser != nil
        return $browser.downcase()
      end
    end


end



