# Preview all emails at http://localhost:3000/rails/mailers/site_mailer
class SiteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/site_mailer/new_message
  def new_message
    user_name = "Aaron"
    user_email = "aaron@aaron.com"
    user_message = "Hello!"
    SiteMailer.new_message(user_name, user_email, user_message)
  end

end
