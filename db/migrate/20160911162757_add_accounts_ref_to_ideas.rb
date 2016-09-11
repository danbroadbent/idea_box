class AddAccountsRefToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :account, index: true, foreign_key: true
  end
end
