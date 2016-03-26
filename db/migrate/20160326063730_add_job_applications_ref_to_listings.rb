class AddJobApplicationsRefToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :job_applications, index: true
  end
end
