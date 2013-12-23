class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :inactive, :boolean
    add_column :users, :supervisor_id, :integer
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
  end
end
