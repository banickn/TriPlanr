class PeriodizationCycle < ApplicationRecord
  belongs_to :periodization_year
  has_many :periodization_weeks

  accepts_nested_attributes_for :periodization_weeks
end
