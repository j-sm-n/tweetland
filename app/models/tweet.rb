class Tweet
    attr_reader :created_at
    
    def initialize(raw_tweet)
        @created_at = format_time(raw_tweet[:created_at])
    end

    def format_time(raw_time)
        datetime = DateTime.parse(raw_time)
        datetime.strftime('%a %b %d, %Y %I:%M%P')
    end
end