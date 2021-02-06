class ChildrenWorkout < ApplicationRecord
  belongs_to :child
  belongs_to :workout
end
