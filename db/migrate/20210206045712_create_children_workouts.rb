class CreateChildrenWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :children_workouts do |t|
      t.integer  :child_id
      t.integer :workout_id
      t.timestamps
    end
    add_foreign_key :children_workouts, :workouts
    add_foreign_key :children_workouts, :children
  end
end
