class JobApplication < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  has_one :notification
end
