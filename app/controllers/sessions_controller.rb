class SessionsController < ApplicationController

    def current_user
        session[:user_id]
    end

    def new
    end
    
    def create
        if !params[:username].nil? && !params[:username].empty?
            session[:username] = params[:username]
            redirect_to '/'
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete.username
        redirect_to '/'
    end

    def home
    end


end