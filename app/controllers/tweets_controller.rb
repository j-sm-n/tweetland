class TweetsController < ApplicationController
    before_action :logged_in?, only: [:index]

    def index
    end

    def create
        byebug
    end

    private

    def tweet_search_params
        params.permit(:handle_search)
    end
end
