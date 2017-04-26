class RemoveTypeFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :type, :string
  end
end
