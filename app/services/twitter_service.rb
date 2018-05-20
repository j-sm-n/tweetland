class TwitterService
  def self.find_top_tweets_by_handle(handle)
    tweets = []
    CLIENT.search(handle, result_type: 'recent').take(25).each do |tweet|
        tweets << Tweet.new(tweet)
    end
    tweets
  end

  def self.is_valid_handle?(handle)
    CLIENT.user?(handle)
  end
end