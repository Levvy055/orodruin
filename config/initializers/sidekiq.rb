Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://redis/'),
    namespace: 'background-cluster'
  }
end

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://redis/'),
    namespace: 'background-cluster'
  }
end
