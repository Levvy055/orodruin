class AddCustomFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string, null: false, default: nil
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
  end
end
