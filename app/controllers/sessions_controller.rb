class SessionsController < ApplicationController

    def home
    end

    def destroy
        # clears the session/logs the user out
        # redirects to the home page
        session.clear
        redirect_to root_path
    end

    def create
        # if we found the user & the password is correct 
        # set the session, 
        # and redirect to the users path
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            # redirect vs. render 
            # if the user hasnt signed up yet
            # we don't want them to go back to the page
            # with the info prepopulated
            # for security reasons we want the form to clear
            flash[:message] = "Incorrect credentials, please try again"
            redirect_to "/login"
        end
    end


end