class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :numberofseats
      t.string :email

      t.timestamps null: false
    end
  end
end
