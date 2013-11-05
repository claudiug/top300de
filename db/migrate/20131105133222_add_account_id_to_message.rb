class AddAccountIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :account_id, :integer
  end
end
