class AddColumnsToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :comment, :string
    add_column :feedbacks, :pro, :string
    add_column :feedbacks, :contra, :string
  end
end
