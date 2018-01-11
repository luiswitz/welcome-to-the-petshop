require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module WelcomeToThePetshop
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    config.active_record.time_zone_aware_types = [:datetime, :time]
  end
end
