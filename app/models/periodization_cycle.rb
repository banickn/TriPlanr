class PeriodizationCycle < ApplicationRecord
  belongs_to :periodization_year
  has_many :periodization_weeks
end
