module ListingsHelper
  def get_poster_name(poster_id)
    User.find(poster_id).name
  end
  
  def get_category_name(category_id)
    Listing.find(category_id).category.name
  end
end
