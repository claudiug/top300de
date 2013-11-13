class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :trips, :name, unique: true, name: "trip_name"
    add_index :trips, :latitude, name: "trip_lat"
    add_index :trips, :longitude, name: "trip_lgn"
  end
end
