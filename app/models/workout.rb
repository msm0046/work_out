class Workout < ApplicationRecord
  has_many :children_workouts
  belongs_to :monthly_workout
end
