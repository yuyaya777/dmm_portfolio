class RemoveCategoriesIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :categories_id, :integer
  end
end
