module ListingsHelper
  def get_poster_name(poster_id)
    User.find(poster_id).name
  end
end
