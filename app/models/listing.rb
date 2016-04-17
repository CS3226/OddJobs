class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :job_applications
  validates :title, :description, :remuneration, :category_id, presence: true
  validate :within_user_weekly_quota, :on => :create

  QUOTA = 5
  def within_user_weekly_quota
    listings_posted_this_week = Listing.where(:poster_id => self.poster_id, :created_at => 1.week.ago..DateTime.now)
    if listings_posted_this_week.count > QUOTA
      errors.add(:base, "Each user is allowed to post #{QUOTA} listings a week.")
    end
  end
end
