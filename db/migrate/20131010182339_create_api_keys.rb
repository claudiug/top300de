class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :key
      t.integer :user_id
      t.datetime :valid_until
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
