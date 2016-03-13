class AddBusEmailToBusRequest < ActiveRecord::Migration
  def change
    add_column :bus_requests, :bus_email, :string
  end
end
