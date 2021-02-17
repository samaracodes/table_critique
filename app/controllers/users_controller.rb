class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.user_id
            redirect_to user_path(@user)
        else 
            flash[:error] = "Please Try Again"
            render :new
        end
    end

    def show 
        @user = User.find_by(params[:id]) unless !@user 
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password_digest)


end
