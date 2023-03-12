Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN', '')
  config.breadcrumbs_logger = [:active_support_logger]
  config.environment = ENV.fetch('RAILS_ENV', 'development')

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = ENV.fetch('SENTRY_TRACES_SAMPLE_RATE', 0.5).to_f
end
