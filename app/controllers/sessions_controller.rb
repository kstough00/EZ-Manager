class SessionsController < ApplicationController

    def new
    #    binding.pry
    end

    def create
        if request.env["omniauth.auth"]
            @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
            if @user.nil?
                @user = User.create(username: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"])
            end
            log_in(@user)
            redirect_to artists_path
        else

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
    end

    def destroy
        session.clear
        redirect_to login_path
    end


end
