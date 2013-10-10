class AddDefaultFalseToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :is_active, :boolean, default: false
  end
end
