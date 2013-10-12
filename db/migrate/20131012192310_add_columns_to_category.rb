class AddColumnsToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :is_active, :boolean, default: true
    add_column :categories, :seo, :text
    add_column :categories, :description, :text

  end
end
