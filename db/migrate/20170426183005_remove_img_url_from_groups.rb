class RemoveImgUrlFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :img_url, :string
  end
end
