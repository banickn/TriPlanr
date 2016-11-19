json.extract! workout, :id, :date, :title, :description, :sport_id, :tss, :duration, :created_at, :updated_at
json.url workout_url(workout, format: :json)