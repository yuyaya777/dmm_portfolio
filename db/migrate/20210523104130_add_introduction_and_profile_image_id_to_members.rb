class AddIntroductionAndProfileImageIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :introduction, :text
    add_column :members, :profile_image_id, :string
  end
end
