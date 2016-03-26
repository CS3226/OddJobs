class AddDetailsColumnToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :details, :text
  end
end
