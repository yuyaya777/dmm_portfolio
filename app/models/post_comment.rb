class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :member
  has_many :post_comment_favorites
  # コメントに対してのfavorited_byメソッド
  def favorited_by?(member)
    post_comment_favorites.where(member_id: member.id).exists?
  end
end
