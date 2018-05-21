module TweetHelper
    def fetch_tweets_by_handle(handle)
        last_saved_handle = $redis.get('last_saved_handle')
        tweets            = $redis.get('tweets')
        if (last_saved_handle.nil? || last_saved_handle != handle)
            tweets = TwitterService.find_top_tweets_by_handle(handle).to_json
            $redis.set('last_saved_handle', handle)
            $redis.set('tweets', tweets)

            $redis.expire('last_saved_handle', 5.minutes.to_i)
            $redis.expire('tweets', 5.minutes.to_i)
        end
        JSON.parse(tweets, symbolize_names: true)
    end

    def get_formatted_tweets(raw_tweets)
        formatted_tweets = []
        raw_tweets.each do |tweet|
            formatted_tweets << Tweet.new(tweet)
        end
        formatted_tweets
    end
end