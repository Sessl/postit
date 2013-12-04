class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        @user = User.find_by(slug: params[:id])
        @user_posts = Post.all.where(creator: current_user)
        @user_comments = Comment.all.where(creator: current_user)
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
          flash[:notice] = "You are registered"
          session[:user_id] = @user.id
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