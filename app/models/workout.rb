class Workout < ApplicationRecord
  belongs_to :sport
  validates_presence_of :title, :date, :duration
end