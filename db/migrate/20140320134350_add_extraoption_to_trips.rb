class AddExtraoptionToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :option_1, :string
    add_column :trips, :option_2, :string
  end
end
