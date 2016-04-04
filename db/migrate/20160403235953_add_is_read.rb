class AddIsRead < ActiveRecord::Migration
  def change
  	add_column :notifications, :is_read?, :boolean
  	add_column :notifications, :description, :text
  end
end
