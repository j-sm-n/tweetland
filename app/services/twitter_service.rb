class TwitterService
  def self.find_top_tweets_by_handle(handle)
    tweets = []
    CLIENT.user_timeline(handle, count: 25).each do |tweet|
        tweets << tweet
    end
    tweets
  end

  def self.is_valid_handle?(handle)
    CLIENT.user?(handle)
  end
end