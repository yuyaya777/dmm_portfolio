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

  def show
    @post = Post.find(params[:id])
    # ランキングをsort_byで並び替え
    @all_ranks = @post.post_comments.sort_by{|x| x.post_comment_favorites.count}.reverse
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to member_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to member_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image_id, :category_id, :member_id)
  end
end
