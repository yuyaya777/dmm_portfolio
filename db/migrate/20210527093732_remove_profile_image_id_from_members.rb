class RemoveProfileImageIdFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :profile_image_id, :integer
  end
end
