class RemoveDateFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :date, :date
  end
end
