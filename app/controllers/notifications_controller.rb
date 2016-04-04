class NotificationsController < ApplicationController
	def new
 		if user_signed_in?
      		@notification = Notification.new
    	else
      		redirect_to "/users/sign_in"
      		flash[:alert] = "Please sign in to view notifications"
    	end		
	end

	def index
		@notifications = Notification.all
	end

	def show
		@notication = Notification.find(params[:id])
	end

	def create
		@notification = Notification.new(title: 'An application was made from #current_user_id')
		@notification.sender_id = current_user.id;

		@notification.save
		redirect_to @notification
	end

	# DELETE /job_applications/1
	# DELETE /job_applications/1.json
	# def destroy
	# @job_application.destroy
	# 	respond_to do |format|
	#   		format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
	#   		format.json { head :no_content }
	# 	end
	# end

	private
		def notification_params
			params.require(:notification).permit(:title,:is_read?)
		end
end
