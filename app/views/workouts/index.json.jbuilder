json.array!(@workouts) do |event|
  json.extract! event, :id, :title, :description
  json.start event.date
  json.url workout_url(event, format: :html)
end
