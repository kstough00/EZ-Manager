class SessionController < ApplicationController

    get '/login' do 
        erb :"/session/login"
    end

    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/"
        else
            redirect "/login"
        end
    end

    delete '/logout' do 
        logout!
        redirect "/"
    end


end
