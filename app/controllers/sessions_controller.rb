class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "You have been signed in"
        else
            flash.now[:alert] = "There was a problem signing you in"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path, notice: "You have been signed out"
    end
end