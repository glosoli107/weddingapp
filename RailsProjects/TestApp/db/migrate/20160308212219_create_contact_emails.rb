class CreateContactEmails < ActiveRecord::Migration
  def change
    create_table :contact_emails do |t|
      t.text :user_name
      t.text :user_email
      t.text :user_message

      t.timestamps null: false
    end
  end
end
