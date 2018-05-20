class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to tweets_path, notice: "Logged in!"
        else
            flash.now[:danger] = "Username and/or Password is invalid. Try again."
            render :new
        end
    end

    def destroy
        session.clear
        flash[:info] = "Logged out!"
        redirect_to root_path
    end
end
