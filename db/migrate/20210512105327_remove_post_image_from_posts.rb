class RemovePostImageFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :post_image, :integer
  end
end