require 'twitter'

config = {
  consumer_key:    ENV['twitter_consumer_key'],
  consumer_secret: ENV['twitter_consumer_secret'],
}

CLIENT = Twitter::REST::Client.new(config)