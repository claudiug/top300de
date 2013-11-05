class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.string :name
      t.integer :account_id

      t.timestamps
    end
  end
end
