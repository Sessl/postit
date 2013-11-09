class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update] # 1. before_action is used to set up instance variables we need in the actions. The parameters ensure that set_post only applies to those actions.
  # if we don't specify set_post will execute before index and we get an error.
  # 2. It can also be used in redirect. To implement conditions to control actions when redirecting.

  def index
     @posts = Post.all
  end

  def show
    #@post= Post.find(params[:id]) intead using before action set_post
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
    
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first #Hardcoding user id since longin/logout is not set up as yet.
    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
   # @post = Post.find(params[:id])
  end

  def update
    #@post = Post.find(params[:id])


    if @post.update(post_params)
      flash[:notice] = "Your post was updated."
      redirect_to post_path                    
    else
      render 'edit'
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post= Post.find(params[:id])
  end
end
