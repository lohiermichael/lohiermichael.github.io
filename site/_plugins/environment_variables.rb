require 'dotenv'

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    def generate(site)
      site.config['env'] = {}

      if Jekyll.env == "development"
        load_local_env(site)
      else
        load_github_env(site)
      end

      log_available_variables(site)
    end

    private

    def load_local_env(site)
      root_dir = File.expand_path('../../', File.dirname(__FILE__))
      env_file = File.join(root_dir, '.env')
      
      if File.exist?(env_file)
        Dotenv.load(env_file)
        ENV.each do |key, value|
          site.config['env'][key] = value.to_s
        end
        Jekyll.logger.info(
          "Environment:", 
          "Loaded local .env file successfully"
        )
      else
        Jekyll.logger.warn(
          "Environment:",
          "Local .env file not found at: #{env_file}"
        )
      end
    end

    def load_github_env(site)
      # List of expected environment variables
      expected_vars = [
        'FORMSPREE_ID',
      ]

      expected_vars.each do |var|
        if ENV[var]
          site.config['env'][var] = ENV[var].to_s
          Jekyll.logger.info(
            "Environment:", 
            "Loaded GitHub variable: #{var}"
          )
        else
          Jekyll.logger.warn(
            "Environment:",
            "GitHub variable not found: #{var}"
          )
        end
      end
    end

    def log_available_variables(site)
      if site.config['env'].empty?
        Jekyll.logger.warn(
          "Environment:",
          "No environment variables were loaded"
        )
      else
        Jekyll.logger.info(
          "Environment:",
          "Available variables: #{site.config['env'].keys.join(', ')}"
        )
      end
    end
  end
end
