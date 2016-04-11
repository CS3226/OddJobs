module UsersHelper
  	def get_application_by_id(id)
    	JobApplication.find(id)
  	end	
	def get_listing_title (listing_id) 
		Listing.find(listing_id).title
	end
	def get_listing_title_by_app(app_id)
		Listing.find(JobApplication.find(app_id).listing_id).title
	end	
	def get_listing (listing_id) 
		Listing.find(listing_id)
	end	

	def get_user_name (user_id)
		User.find(user_id).name
	end
end
