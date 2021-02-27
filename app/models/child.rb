class Child < ApplicationRecord
  has_many :children_workouts
  has_many :monthly_workouts
end
