class PeriodizationWeek < ApplicationRecord
  belongs_to :periodization_cycle
  #default_scope { order(id: :desc) }
end
