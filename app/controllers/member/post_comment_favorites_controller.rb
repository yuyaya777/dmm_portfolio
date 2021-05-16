class Member::PostCommentFavoritesController < ApplicationController
  def create
    @post_comment = PostComment.find(params[:post_comment_id])
    post_comment_favorite = current_member.post_comment_favorites.new(post_comment_id: @post_comment.id)
    post_comment_favorite.save
    redirect_to request.referer
  end

  def destroy
    @post_comment = PostComment.find(params[:post_comment_id])
    post_comment_favorite = current_member.post_comment_favorites.find_by(post_comment_id: @post_comment.id)
    post_comment_favorite.destroy
    redirect_to request.referer
  end
end
