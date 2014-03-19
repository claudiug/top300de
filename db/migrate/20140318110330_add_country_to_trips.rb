class AddCountryToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :country, :string
    add_column :trips, :population, :double
  end
end
