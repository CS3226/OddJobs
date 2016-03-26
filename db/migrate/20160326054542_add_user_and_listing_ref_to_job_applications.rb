class AddUserAndListingRefToJobApplications < ActiveRecord::Migration
  def change
    add_reference :job_applications, :user, index: true
    add_reference :job_applications, :listing, index: true 
  end
end
