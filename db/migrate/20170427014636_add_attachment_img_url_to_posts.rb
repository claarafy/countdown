class AddAttachmentImgUrlToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :img_url
    end
  end

  def self.down
    remove_attachment :posts, :img_url
  end
end
