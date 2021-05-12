class Member::PostsController < ApplicationController

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.save!
    redirect_to member_posts_path
  end

  def index
    @posts = Post.all.page(params[:page]).per(10)
    @post_all = Post.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image_id, :category_id, :member_id)
  end
end
