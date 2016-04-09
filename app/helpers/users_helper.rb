module UsersHelper
  def get_application_by_id(id)
    JobApplication.find(id)
  end	
end
