json.array!(@bus_requests) do |bus_request|
  json.extract! bus_request, :id, :number_of_seats, :names
  json.url bus_request_url(bus_request, format: :json)
end
