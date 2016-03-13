class BusRequest < ActiveRecord::Base
  validates :names, :bus_email, presence: {message: "cannot be blank. Please enter the name(s)."}
end
