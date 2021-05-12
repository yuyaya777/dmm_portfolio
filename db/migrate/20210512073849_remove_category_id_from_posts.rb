class RemoveCategoryIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :CategoryId, :integer
  end
end
