class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :job_applications
end
