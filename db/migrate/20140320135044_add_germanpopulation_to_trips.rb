class AddGermanpopulationToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :ger_population, :float
  end
end
