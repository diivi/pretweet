class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_logged_in!
        unless Current.user
            redirect_to sign_in_path, alert: 'You must be logged in to make this request.'
        end
    end
end
