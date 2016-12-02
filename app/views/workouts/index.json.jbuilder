json.array!(@workouts) do |event|
  json.extract! event, :id, :title, :description
  json.start event.date
  json.className event.sport.name
  json.url workout_url(event, format: :html)
end
