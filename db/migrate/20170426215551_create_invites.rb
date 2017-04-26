class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :group_id
      t.text :message
      t.boolean :accepted

      t.timestamps
    end
  end
end
