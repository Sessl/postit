class PostsController < ApplicationController
  def index
     @posts = Post.all
  end

  def show
    @post= Post.find(params[:id])
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
    @post = Post.find(params[:id])
    
  end

  def update
    @post = Post.find(params[:id])


    if @post.update(post_params)
      flash[:notice] = "Your post was updated."
      redirect_to post_path                    
    else
      render 'edit'
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end
end
