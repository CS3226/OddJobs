module UsersHelper
  def get_application_by_id(id)
    JobApplication.find(id)
  end	

  def get_listing_title (listing_id) 
    begin
      Listing.find(listing_id).title
    rescue ActiveRecord::RecordNotFound
      ''
    end
  end

  def get_listing_title_by_app(app_id)
    Listing.find(JobApplication.find(app_id).listing_id).title
  end	

  def get_listing (listing_id) 
    begin
      Listing.find(listing_id)
    rescue ActiveRecord::RecordNotFound
      ''
    end
  end	

  def get_user_name (user_id)
    User.find(user_id).name
  end

  def read_notification(notification)
    notification.is_read = true;
    notification.save;
  end

  def get_open_status(listing)
    if listing.is_open?
      "Open"
    else
      "Closed"
    end
  end
end
