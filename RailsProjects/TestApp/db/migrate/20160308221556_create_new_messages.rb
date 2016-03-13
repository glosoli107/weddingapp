class CreateNewMessages < ActiveRecord::Migration
  def change
    create_table :new_messages do |t|
      t.string :user_name
      t.string :user_email
      t.text :user_message

      t.timestamps null: false
    end
  end
end
