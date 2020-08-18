require 'logger'
$logger = Logger.new(STDOUT)

module ReadYamlFile
    require 'yaml'
    config = YAML.load_file("../resources/properties.yaml")
    
    $url = config["url"]
    $browser = config["browser"]
    $is_headless = config['headless']
    $browser_stack = config["browser_stack"]
    $remote_browser = config["remote_browser"]
    $os_version = config["os_version"]
    $resolution = config["resolution"]
    $os = config["os"]
    $browser_version = config["browser_version"]
    $build = config["build_name"]
    $name = config["name"]
    $project = config["project"]
    $device = config["device"]
    $browserstack_local = config["browserstack.local"]
    $browserstack_selenium_version = config["browserstack.selenium_version"]
    $user_name = config["user_name"]
    $password = config["access_key"]
    $app = config["app_location"]
    $local_app = config["local_app_location"]
    $server = config['server']

    def get_url()
        $logger.info("The url is " + $url)
        return $url
    end

    def get_browser()
      if $browser != nil
        return $browser.downcase()
      end
    end

    def run_headless
      if $is_headless != nil
        return $is_headless
      end
    end

    def run_browser_stack()
      if $browser_stack != nil
        return $browser_stack
      end
    end

    def get_remote_browser()
      if $remote_browser != nil
        return $remote_browser
      end
    end

    def get_os_version()
      if $os_version != nil
        return $os_version
      end
    end

    def get_resolution()
      if $resolution != nil
        return $resolution
      end
    end

    def get_os()
      if $os != nil
        return $os
      end
    end

    def get_browser_version() 
      if $browser_version != nil
        return $browser_version
      end
    end

    def get_build_name()
      if $build != nil
        return $build
      end
    end

    def get_test_name()
      if $name != nil
        return $name
      end
    end

    def get_project_name()
      if $project != nil
        return $project
      end
    end

    def get_device_name()
      if $device != nil
      return $device
      end
    end

    def get_browserstack_selenium_version()
      if $browserstack_selenium_version != nil
        return $browserstack_selenium_version
      end
    end

    def get_user_name()
      if $user_name != nil
        return $user_name
      end
    end

    def get_password()
      if $password != nil
        return $password
      end
    end

    def get_app_location()
      if $app != nil
        return $app
      end
    end

    def get_app_location_local()
      if $local_app != nil
        return $local_app
      end
    end

    def get_server()
      if $server != nil
        return $server
      end
    end
end



