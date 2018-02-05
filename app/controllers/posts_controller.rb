class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.create(create_params)

    redirect_to post_path(post)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update(create_params)

    redirect_to post_path(post)
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def create_params
    params.require(:post).permit(:title, documents: [])
  end
end
