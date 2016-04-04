class AddRefJobApplicationToNotification < ActiveRecord::Migration
  def change
  	add_reference :job_applications, :notifications, index: true
  end
end
