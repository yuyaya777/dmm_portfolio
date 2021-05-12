class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :member
  has_many :post_comment_favorites
end
