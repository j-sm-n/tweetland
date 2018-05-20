class TweetsController < ApplicationController
    before_action :logged_in?, only: [:index]

    def index
    end

    def create
        byebug
        if TwitterService.is_valid_handle?(tweet_search_params['handle_search'])
            @tweets = TwitterService.find_top_tweets_by_handle(tweet_search_params)
            redirect_to tweets_path
        else
            flash[:error] = "Twitter handle doesn't exist"
            render :index
        end
    end

    private

    def tweet_search_params
        params.permit(:handle_search)
    end
end
