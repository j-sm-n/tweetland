class TweetsController < ApplicationController
    include TweetHelper
    before_action :logged_in?, only: [:index, :search]

    def index
        raw_tweets = fetch_tweets_by_handle(params[:handle])
        @tweets    = get_formatted_tweets(raw_tweets)
    end

    def search
    end

    def create
        handle = tweet_search_params['handle_search']
        if TwitterService.is_valid_handle?(handle)
            redirect_to controller: 'tweets', action: 'index', handle: handle
        else
            flash[:error] = "Twitter handle doesn't exist"
            render :search
        end
    end

    private

    def tweet_search_params
        params.permit(:handle_search)
    end
end
