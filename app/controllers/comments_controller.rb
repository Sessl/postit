class CommentsController < ApplicationController

    
    def create
        
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comments_params)

        if @comment.save
          flash[:notice]= "Your comment was created"
          redirect_to post_path(@post)
        else
          @post.comments.reload
          render 'posts/show'
        end
          
    end

    private

    def comments_params
        params.require(:comment).permit(:body)
    end
end