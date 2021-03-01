class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception

    # gives access to the views
    helper_method :current_user, :logged_in?

    private

    def current_user
        #we dont user @user because it might override the user 
        # variable in the controller

        # 1. if there is a session[:user_id] proceed.. 
        # ....(we dont want to make a call to the database 
        # & not find anything) 
        # 2. if @current_user already exists then set the user to @current_user
        # 3. if not, find user by user_id in the users table and set 
        # to @current_user. 
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end
