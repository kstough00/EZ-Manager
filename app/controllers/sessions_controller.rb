class SessionsController < ApplicationController

    def new
    #    binding.pry
    end

    def create
        # raise_params
        if request.env["omniauth.auth"]
            @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
            if @user.nil?
                @user = User.create(username: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"], password: SecureRandom.hex)
                # log_in(@user)
                # redirect_to stages_path
            end
                log_in(@user)
                redirect_to stages_path
        else
            @user = User.find_by(username: params[:username])
            if !@user
                @error = "Account not found. Please try again."
                render :new
            elsif !@user.authenticate(params[:password])
                @error = "Password incorrect. Please try again."
                wrender :new
            else
                log_in(@user)
                redirect_to stages_path
            end
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end


end
