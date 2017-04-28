class RemoveProiflePicFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :profile_pic, :string
  end
end
