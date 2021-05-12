class Member::PostsController < ApplicationController

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new
    @post.save(post_params)
    redirect_to member_posts_path
  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category_id)
  end
end
