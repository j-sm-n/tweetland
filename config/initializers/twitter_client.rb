require 'twitter'

config = {
  consumer_key:    ENV['twitter_consumer_key'],
  consumer_secret: ENV['twitter_consumer_secret'],
}

Twitter::REST::Client.new(config)