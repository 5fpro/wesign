Sidekiq.configure_server do |config|
  config.redis = { :url => Setting.sidekiq[:redis], :namespace => Setting.sidekiq[:namespace] }
end

# When in Unicorn, this block needs to go in unicorn's `after_fork` callback:
Sidekiq.configure_client do |config|
  config.redis = { :url => Setting.sidekiq[:redis], :namespace => Setting.sidekiq[:namespace] }
end

