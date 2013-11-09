require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Joshjordan
  class Application < Rails::Application
    #Use Redis as a cache store in all environments
    #Redis has additional benefits such as acting as a pub/sub provider
    #that all web servers are already connected to
    config.cache_store = :redis_store

    #Rack::Lock is stupid (and is incompatiable with my websocket strategy)
    #http://tenderlovemaking.com/2012/06/18/removing-config-threadsafe.html
    config.middleware.delete "Rack::Lock"
  end
end
