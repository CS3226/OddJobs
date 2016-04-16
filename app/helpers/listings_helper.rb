module ListingsHelper
  def get_poster_name(poster_id)
    User.find(poster_id).name
  end
  
  def get_category_name(category_id)
    Listing.find(category_id).category.name
  end

  def get_applicant_name(applicant_id)
    User.find(applicant_id).name
  end

  def get_applicant_email(applicant_id)
  	User.find(applicant_id).email
  end

  def get_applicant_date(applicant_id)
  	User.find(applicant_id).created_at.to_date
  end

end
