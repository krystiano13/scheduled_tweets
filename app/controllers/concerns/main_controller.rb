class MainController < ApplicationController
    def index()
        flash[:message] = "Hello User !"
    end
end