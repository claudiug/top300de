class TripCategory < ActiveRecord::Migration
  def change

    create_table :trips_categories do |t|
      t.belongs_to :trip
      t.belongs_to :category

    end

  end
end
