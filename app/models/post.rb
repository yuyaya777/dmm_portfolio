class Post < ApplicationRecord

  belongs_to :category
  belongs_to :member
  has_many :post_comments
  has_many :post_favorites
  # 投稿物に対してのfavorited_byメソッド
  def favorited_by?(member)
    post_favorites.where(member_id: member.id).exists?
  end

  attachment :post_image
end
