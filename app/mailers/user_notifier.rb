class UserNotifier < ApplicationMailer
  default :from => 'admin@nusoddjobs.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
         :subject => 'Welcome to OddJobs@NUS!' )
  end

  def send_new_job_application_notification(poster, job_application)
    @poster = poster
    @job_application = job_application
    mail( :to => @poster.email,
         :subject => 'OddJobs@NUS: New Job Application!'
  end
end
