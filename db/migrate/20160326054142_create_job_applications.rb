class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.integer :applicant
      t.integer :listing

      t.timestamps null: false
    end
  end
end
