class MonthlyWorkout < ApplicationRecord
  belongs_to :workout
  belongs_to :child
end
