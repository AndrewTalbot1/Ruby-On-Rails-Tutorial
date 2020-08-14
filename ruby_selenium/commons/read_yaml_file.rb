require 'logger'
$logger = Logger.new(STDOUT)

module ReadYamlFile
    require 'yaml'
    config = YAML.load_file("../resources/properties.yaml")
    
    $url = config["url"]
    $browser = config["browser"]
    $remote_browser = config["remote_browser"]
    $os_version = config["os_version"]
    $resolution = config["resolution"]
    $os = config["os"]
    $browser_version = config["browser_version"]
    $name = config["name"]
    $browserstack_local = config["browserstack.local"]
    $browserstack_selenium_version = config["browserstack.selenium_version"]
    $user_name = config["user_name"]
    $password = config["access_key"]

    def get_url()
        $logger.info("The url is " + $url)
        return $url
    end

    def get_browser()
        return $browser
    end

    def get_remote_browser()
        return $remote_browser
    end

    def get_os_version()
        return $os_version
    end

    def get_resolution()
        return $resolution
    end

    def get_os()
        return $os
    end

    def get_browser_version() 
        return $browser_version
    end

    def get_test_name()
        return $name
    end

    def get_browserstack_selenium_version()
        return $browserstack_selenium_version
    end

    def get_user_name()
        return $user_name
    end

    def get_password()
        return $password
    end

end



