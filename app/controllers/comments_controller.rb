class CommentsController < ApplicationController

  before_action :set_post


  def create
   @comment = @post.comments.create(params[:comment].permit(:title, :body))
   redirect_to post_path(@post)
 end

 def destroy
   @comment = @post.comments.find(params[:id])
   @comment.destroy
   redirect_to post_path(@post)
 end


  def set_post
    @post = Post.find(params[:post_id])
  end
end
