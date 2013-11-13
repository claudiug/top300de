class AddIndexToRestaurant < ActiveRecord::Migration
  def change
    add_index :restaurants, :name, unique: true, name: "restaurant_name"
    add_index :restaurants, :slug, unique: true, name: "restaurant_slug"
    add_index :restaurants, :trip_id, name: "restaurant_trip_id"
  end
end
