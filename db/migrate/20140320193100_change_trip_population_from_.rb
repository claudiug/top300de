class ChangeTripPopulationFrom < ActiveRecord::Migration
  def change
    change_column :trips, :population, :string
    change_column :trips, :ger_population, :string
  end
end
