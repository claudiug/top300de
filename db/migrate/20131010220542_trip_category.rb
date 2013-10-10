class TripCategory < ActiveRecord::Migration
  def change

    create_table :categories_trips do |t|
      t.belongs_to :trip
      t.belongs_to :category

    end

  end
end
