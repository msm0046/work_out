class Workout < ApplicationRecord
  has_many :children_workouts
  has_many :monthly_workout
end
