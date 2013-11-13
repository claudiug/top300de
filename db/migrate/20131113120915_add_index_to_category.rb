class AddIndexToCategory < ActiveRecord::Migration
  def change
    add_index :categories, :name, unique: true, name: "category_name"
    add_index :categories, :slug, unique: true, name:  "category_slug"
  end
end
