class PostCommentFavorite < ApplicationRecord
  belongs_to :member
  belongs_to :post_comment
end
