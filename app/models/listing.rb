class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :job_applications
  validates :category_id, presence: true
end
