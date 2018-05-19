class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(allowed_params)
        byebug
        if @user.save
            redirect_to root_path, notice: 'Success! Welcome to Tweetland!'
        else
            render :new
        end
    end

private

    def allowed_params
        params.require(:user).permit(:email, :password_digest)
    end
end
