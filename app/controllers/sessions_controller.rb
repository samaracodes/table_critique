class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :create
    

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

    def github
        #find or create a user using the attributes auth
        user = User.find_or_create_by(username: auth['info']['nickname']) do |u|
            u.username = auth['info']['nickname']
            u.password = SecureRandom.hex(10)
        end

        if user.save
          session[:user_id] = user.id
          redirect_to user_path(user)
        else 
            flash[:message] = "Something went wrong, please try again!"
            redirect_to '/'
        end
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
    

end