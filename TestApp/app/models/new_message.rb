class NewMessage < ActiveRecord::Base
  validates :user_name, :user_email, :user_message, presence: true
end
