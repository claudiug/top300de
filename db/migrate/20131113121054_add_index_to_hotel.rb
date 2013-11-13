class AddIndexToHotel < ActiveRecord::Migration
  def change
    add_index :hotels, :name, unique: true, name: "hotel_name"
    add_index :hotels, :slug, unique: true, name: "hotel_slug"
    add_index :hotels, :trip_id, unique: true, name: "hotel_trip_id"
  end
end
