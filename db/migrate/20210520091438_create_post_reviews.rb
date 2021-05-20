class CreatePostReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :post_reviews do |t|
      t.integer :member_id
      t.integer :post_id
      t.float :review, default: 0
      t.text :review_comment

      t.timestamps
    end
  end
end
