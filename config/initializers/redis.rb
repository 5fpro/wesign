if Setting.redis.is_a?(String)
  uri = URI.parse(Setting.redis)
  Redis.current = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  Redis.current = Redis.new(Setting.redis)
end
begin
  Redis.current.ping
rescue
  puts "warring: No redis server! Please install and start redis, install on MacOSX: 'sudo brew install redis', start : 'redis-server /usr/local/etc/redis.conf'"
end