class WorkoutEntriesController < ApplicationController
  def index
    @year = params[:year]
    @month = params[:month]

    # 受け取った年月でmonthly_workouts テーブルのtarget_dateを検索する
    monthly_workouts = MonthlyWorkout.where(target_date: Date.new(@year, @month, 1))
    # 検索したtarget_dateを元にworkout名を表示する

    workout_name_list = monthly_workouts.map do |monthly_workout|
      monthly_workout.workout.name
    end
    # monthly_workouts テーブルのworkout_idからchildren_workouts テーブルのworkout_idを検索する
    # NOTE: monthly_workouts は配列。MonthlyWorkout レコードがゼロ個以上含まれている
    children_workouts = 
      monthly_workouts.map do |monthly_workout|
        ChildrenWorkout.where(workout_id: monthly_workout.workout_id)
      end
    
    #  検索したworkout_idを元にchildテーブルのnameを表示する
    # HINT: map で解決できそう
    children_name_list = 
      children_workouts.map do |children_workout|
        children_workout.child.name
      end
    end
  end
end
