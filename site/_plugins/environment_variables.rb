require 'dotenv'

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    def generate(site)
      # Load environment variables from root .env file 
      if Jekyll.env == "development"
        root_dir = File.expand_path('../../', File.dirname(__FILE__))
        env_file = File.join(root_dir, '.env')
        
        if File.exist?(env_file)
          Dotenv.load(env_file)
          Jekyll.logger.info(
            "Environment:", 
            "Loaded .env file successfully"
          )
          Jekyll.logger.info(
            "Environment:",
            "FORMSPREE_ID is set to: #{ENV['FORMSPREE_ID']}"
          )
        else
          Jekyll.logger.warn(
            "Environment:",
            ".env file not found at: #{env_file}"
          )
        end
      end

      # Convert ENV to a hash that Liquid can handle
      site.config['env'] = {}
      ENV.each do |key, value|
        site.config['env'][key] = value.to_s
      end
      
      # Debug output
      Jekyll.logger.info(
        "Environment:",
        "Variables available in site.env: #{site.config['env'].keys.join(', ')}"
      )
    end
  end
end
