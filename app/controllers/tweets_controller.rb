class TweetsController < ApplicationController
    before_action :logged_in?, only: [:index, :search]

    def index
        @tweets = @tweets = TwitterService.find_top_tweets_by_handle(params[:handle])
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
