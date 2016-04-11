module UsersHelper
	def get_listing_title (listing_id) 
		Listing.find(listing_id).title
	end	
	def get_listing (listing_id) 
		Listing.find(listing_id)
	end	
end
