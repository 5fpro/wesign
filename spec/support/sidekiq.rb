module Sidekiq

  def sidekiq_reset!
    Sidekiq::Queue.new("default").clear
  end

  def sidekiq_queue_size
    Sidekiq::Queue.new("default").size
  end

end