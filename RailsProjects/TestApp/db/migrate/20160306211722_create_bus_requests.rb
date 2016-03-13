class CreateBusRequests < ActiveRecord::Migration
  def change
    create_table :bus_requests do |t|
      t.integer :number_of_seats
      t.text :names

      t.timestamps null: false
    end
  end
end
