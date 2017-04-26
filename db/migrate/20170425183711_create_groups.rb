class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :type
      t.text :description
      t.date :date
      t.string :img_url

      t.timestamps
    end
  end
end
