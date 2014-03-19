class AddGermanfieldToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :ger_name, :string
    add_column :trips, :ger_city, :string
    add_column :trips, :ger_description, :text
    add_column :trips, :ger_country, :string
  end
end
