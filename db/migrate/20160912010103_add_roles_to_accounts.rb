class AddRolesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :role, :integer, default: 0
  end
end
