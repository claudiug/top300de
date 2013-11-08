class AddIsFeatureToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :is_feature, :boolean, default: false
  end
end
