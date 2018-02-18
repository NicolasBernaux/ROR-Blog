class CommentsController < ApplicationController

  before_action :set_post



  def create
   @comment = @post.comments.create(params[:comment].permit(:body).merge(user: current_user))
   redirect_to post_path(@post)
 end

 def destroy
   @comment = @post.comments.find(params[:id])
   @comment.destroy
   redirect_to post_path(@post)
 end

 def edit
   @comment = Comment.find(params[:id])
   @post = Post.find(params[:post_id])
 end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(params[:comment].permit(:body).merge(user: current_user))
    redirect_to @post
  end



  def set_post
    @post = Post.find(params[:post_id])
  end
end
