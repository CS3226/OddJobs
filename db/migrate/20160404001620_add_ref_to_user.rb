class AddRefToUser < ActiveRecord::Migration
  def change
  	add_reference :notifications, :job_application, index: true, foreign_key: true
  	add_reference :notifications, :user, index: true, foreign_key: true
  end
end
