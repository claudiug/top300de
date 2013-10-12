class AddFieldToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :email, :string
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :is_active, :boolean
    add_column :restaurants, :web_page, :string
  end
end
