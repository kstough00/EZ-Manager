class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if !@user
            @error = "Account not found. Please try again."
            render :new
        elsif !@user.authenticate(params[:password])
          @error = "Password incorrect. Please try again."
          render :new
        else
            log_in(@user)
            redirect_to artists_path
        end
    end

    def destroy
        session.clear
        redirect_to artists_path
    end


end
