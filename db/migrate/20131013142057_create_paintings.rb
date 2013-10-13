class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.integer :trip_id
      t.boolean :is_feature
      t.boolean :is_active

      t.timestamps
    end
  end
end
