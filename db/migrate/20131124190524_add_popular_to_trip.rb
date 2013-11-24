class AddPopularToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :popular, :boolean
  end
end
