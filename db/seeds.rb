# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Workoutテーブルのnameカラムのデータを用意する
workout_1 = Workout.new(name: 'おにごっこ')
workout_2 = Workout.new(name: 'なわとび')
workout_3 = Workout.new(name: 'トランプ')
[workout_1, workout_2, workout_3].map(&:save)

# MonthlyWorkoutテーブルのworkout_idカラムをtarget_dateカラムのデータを用意する
[workout_1, workout_2, workout_3].each do |workout|
  MonthlyWorkout.create(workout_id: workout.id, target_date: Date.new(2021, 2, 1))
end

# Childテーブルのnameカラムのデータを用意する
child_1 = Child.new(name: 'はな')
child_2 = Child.new(name: 'つき')
child_3 = Child.new(name: 'みず')
[child_1, child_2, child_3].map(&:save)

# ChildrenWorkoutテーブルのchild_idカラムとworkout_idカラムのデータを用意する
[[child_1, workout_1], [child_2, workout_2], [child_3, workout_3]].each do |child, workout|
  ChildrenWorkout.create(child_id: child.id, workout_id: workout.id)
end
