class ChangePopulationDatatypeInTrip < ActiveRecord::Migration
  def change
  	change_column :trips, :population, :string
  end
end
