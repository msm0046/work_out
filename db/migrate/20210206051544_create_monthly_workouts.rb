class CreateMonthlyWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :monthly_workouts do |t|
      t.integer :workout_id
      t.date :target_date
      t.timestamps
    end
    add_foreign_key :monthly_workouts, :workouts
  end
end
