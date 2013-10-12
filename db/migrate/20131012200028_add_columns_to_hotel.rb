class AddColumnsToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :address, :string
    add_column :hotels, :city_id, :integer
    add_column :hotels, :rating, :integer
    add_column :hotels, :phone_number, :string
    add_column :hotels, :email, :string
    add_column :hotels, :web_page, :string
    add_column :hotels, :is_active, :boolean

  end
end
