module JobApplicationsHelper
  def get_applicant_name(applicant_id)
    User.find(applicant_id).name
  end
  def get_applicant_email(applicant_id)
  	User.find(applicant_id).email
  end
  def get_listing_title(listing_id)
  	Lisitng.find(listing_id).title
  end	
end
