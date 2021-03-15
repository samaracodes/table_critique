class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        #if the user exists in the db
        if @user.save
            #log them in
            session[:user_id] = @user.id
            #redirect to the show page
            redirect_to @user
        else 
            flash[:message] = "Incorrect credentials, please try again"
            redirect_to "/signup"
        end
    end

    def show 
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end


    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
