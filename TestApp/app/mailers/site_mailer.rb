class SiteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.site_mailer.new_message.subject
  #
  def new_message(user_name, user_email, user_message)
    @user_name = user_name
    @user_email = user_email
    @user_message = user_message

    mail to: "hiltneraaron@gmail.com", subject: "New Message from #{user_email}"
  end
end
