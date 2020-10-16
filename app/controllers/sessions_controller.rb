class SessionsController < ApplicationController


    def new
        # @user = User.new
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
            session[:user_id] = @user.id
            redirect_to artists_path
        end
    end

    def destroy
    end


end
