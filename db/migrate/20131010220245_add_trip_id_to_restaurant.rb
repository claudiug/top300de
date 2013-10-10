class AddTripIdToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :trip_id, :integer
  end
end
