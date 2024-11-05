require 'dotenv'

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    def generate(site)
      site.config['env'] = {}

      if ENV['GITHUB_ACTIONS']
        # We're in GitHub Actions
        load_github_env(site)
      else
        # We're in local development
        load_local_env(site)
      end

      log_available_variables(site)
    end

    private

    def load_local_env(site)
      root_dir = File.expand_path('../../', File.dirname(__FILE__))
      env_file = File.join(root_dir, '.env')
      
      if File.exist?(env_file)
        Dotenv.load(env_file)
        copy_env_to_site_config(site)
        Jekyll.logger.info("Environment:", "Loaded local .env file")
      else
        Jekyll.logger.warn(
          "Environment:",
          "Local .env file not found at: #{env_file}"
        )
      end
    end

    def load_github_env(site)
      Jekyll.logger.info("Environment:", "Loading GitHub Actions variables")
      copy_env_to_site_config(site)
    end

    def copy_env_to_site_config(site)
      ENV.each do |key, value|
        site.config['env'][key] = value.to_s
        Jekyll.logger.info("Environment:", "Loaded: #{key}")
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
