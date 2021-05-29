class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :member_id
      t.integer :category_id
      t.string :title
      t.text :body
      t.string :post_image_id

      t.timestamps
    end
  end
end
