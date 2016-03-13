class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :number_of_seats

      t.timestamps null: false
    end
  end
end
