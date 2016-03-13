json.array!(@new_messages) do |new_message|
  json.extract! new_message, :id, :user_name, :user_email, :user_message
  json.url new_message_url(new_message, format: :json)
end
