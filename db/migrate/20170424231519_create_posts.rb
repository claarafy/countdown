class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.string :location
      t.text :body
      t.string :img_url
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
