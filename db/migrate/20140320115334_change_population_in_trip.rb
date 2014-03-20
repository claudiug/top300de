class ChangePopulationInTrip < ActiveRecord::Migration
  def change
    change_column :trips, :population, :float
  end
end
