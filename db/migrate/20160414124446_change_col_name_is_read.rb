class ChangeColNameIsRead < ActiveRecord::Migration
  def change
  	rename_column :notifications, :is_read?, :is_read
  	rename_column :listings, :is_open?, :is_open
  	change_column :listings, :is_open, :boolean, :default => true
  end
end
