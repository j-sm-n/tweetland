class TweetsController < ApplicationController
    before_action :logged_in?, only: [:index]

    def index
    end
end
