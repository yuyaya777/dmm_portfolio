class Post < ApplicationRecord

  belongs_to :category
  belongs_to :member
  has_many :post_comment
  has_many :post_favorites

  attachment :post_image
end
