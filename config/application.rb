require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HackBoard
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Configuración de environment variables.yml
    config.before_configuration do
      env_file = Rails.root.join('config', 'environment_variables.yml').to_s
      if File.exist?(env_file)
        YAML.load_file(env_file)[Rails.env].each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
