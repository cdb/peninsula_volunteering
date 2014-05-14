json.array!(@opportunities) do |opportunity|
  json.extract! opportunity, :id, :title, :description, :date, :start_time, :end_time, :number_of_positions
  json.url opportunity_url(opportunity, format: :json)
end
