class CreatePostCommentFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comment_favorites do |t|
      t.integer :member_id
      t.integer :post_comment_id

      t.timestamps
    end
  end
end
