require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Prevents Rails from trying to eager-load the contents of app/frontend
    config.javascript_path = "frontend"

    # FIXME: not fix the issue
    config.autoload_paths += Dir[Rails.root.join('app', 'policies', '*.rb'), Rails.root.join('app', 'lib', '*.rb')
    ]

    config.perform_caching = true
    # NOTICE: 开发环境还可以用 file_store，在生产环境中，缓存默认是启用的，通常使用 :mem_cache_store 或 :redis_cache_store。您可以根据需要配置缓存设置。
    config.cache_store = :memory_store # 重启后丢失
    config.active_job.queue_adapter = :sidekiq

  end
end
