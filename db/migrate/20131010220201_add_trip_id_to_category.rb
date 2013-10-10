class AddTripIdToCategory < ActiveRecord::Migration
  def change
    add_column :hotels, :trip_id, :integer
  end
end
