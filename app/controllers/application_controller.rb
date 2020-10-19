class ApplicationController < ActionController::Base
    # layout "welcome", only: [:home]

    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        redirect_to login_path unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def log_in(user)
        session[:user_id] = user.id
    end


end