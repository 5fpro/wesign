if (Setting.sentry_dsn rescue nil).present?
  require 'raven'

  Raven.configure do |config|
    config.dsn = Setting.sentry_dsn
  end
end