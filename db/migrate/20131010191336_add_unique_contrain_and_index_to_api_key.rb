class AddUniqueContrainAndIndexToApiKey < ActiveRecord::Migration
  def change
    add_index :api_keys, :key, unique: true
    add_index :api_keys, :user_id
  end
end
