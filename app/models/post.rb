class Post < ApplicationRecord

  belongs_to :category
  belongs_to :member
  has_many :post_comments
  has_many :post_favorites
  # 投稿物に対してのfavorited_byメソッド
  def favorited_by?(member)
    post_favorites.where(member_id: member.id).exists?
  end

  # 検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: where)
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content)
    else
      Post.where('title LIKE ?', '%'+content+'%')
    end
  end



  attachment :post_image
end
