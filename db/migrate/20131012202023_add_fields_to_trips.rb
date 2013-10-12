class AddFieldsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :city, :string
    add_column :trips, :zip_code, :string
    add_column :trips, :description, :text
    add_column :trips, :is_active, :boolean
  end
end
