class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user: current_user))
    if @post.persisted?
      redirect_to posts_url, notice: "L'article a bien été créé"
    else
      render :new
    end
  end

  def update
    if @post.user == current_user
      if @post.update(post_params)
        redirect_to posts_url, notice: "l'article a bien été modifié"
      else
        render :edit
      end
    else
      redirect_to posts_url, notice: "Vous n'etes pas propriétaire"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Le fichier a bien été supprimé"
  end

  def user_posts
    @user = User.find(params[:id])
    @posts = Post.where(user: @user)
  end

  private

  def set_post
    @post = Post.find(params[:id])

  end

  def post_params
    params.require(:post).permit('title', 'content')
  end


end
