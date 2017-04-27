class RemoveImgUrlFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :img_url, :string
  end
end
