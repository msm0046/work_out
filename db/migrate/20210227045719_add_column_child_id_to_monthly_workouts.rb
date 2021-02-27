class AddColumnChildIdToMonthlyWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :monthly_workouts, :child_id, :integer
    add_foreign_key :monthly_workouts, :children
  end
end
