class ChangeGerPopulationDatatypeInTrip < ActiveRecord::Migration
  def change
  	change_column :trips, :ger_population, :string
  end
end
