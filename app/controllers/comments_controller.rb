class CommentsController < ApplicationController
before_action :require_user
    
    def create
        
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comments_params)
        @comment.creator = current_user

        if @comment.save
          flash[:notice]= "Your comment was created"
          redirect_to post_path(@post)
        else
          @post.comments.reload
          render 'posts/show'
        end
          
    end

    def vote
      @comment = Comment.find(params[:id])
      @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    #if @vote.valid?
     # flash[:notice] = "Your vote was counted"
    #else
    #  flash[:error] = "Your vote was not counted"
    #end
   # redirect_to :back
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  
  end

    private

    def comments_params
        params.require(:comment).permit(:body)
    end
end