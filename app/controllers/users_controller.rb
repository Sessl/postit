class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        @user = current_user
    end

    def create
        @user = User.new(user_params)

        if @user.save
          flash[:notice] = "You are registered"
          redirect_to root_path
        else
          render 'new'
        end
    end

    def edit
        @user = current_user

    end

    def update

    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :phone, :time_zone)
    end
end