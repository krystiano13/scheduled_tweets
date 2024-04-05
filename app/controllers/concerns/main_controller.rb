class MainController < ApplicationController
    def index()
        flash[:message] = "Hello User !"
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
end