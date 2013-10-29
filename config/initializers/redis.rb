uri = URI.parse('redis://127.0.0.1:6379')
Redis.current = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :driver => :hiredis)
Resque.redis = Redis.current
Dir["#{Rails.root}/app/workers/*.rb"].each { |file| require file }
