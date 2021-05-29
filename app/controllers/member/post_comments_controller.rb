class Member::PostCommentsController < ApplicationController
  before_action :authenticate_member!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(book_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.member_id = current_member.id
    if @post_comment.save
      redirect_to member_post_path(@post.id)
    else
      render 'member/posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
