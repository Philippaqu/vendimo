json.vending_machines(@machines) do |machine|
  json.extract! machine, :id, :address, :latitude, :longitude
end
