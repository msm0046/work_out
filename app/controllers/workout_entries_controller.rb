class WorkoutEntriesController < ApplicationController
  def index
    @year = params[:year]
    @month = params[:month]

    # 受け取った年月でmonthly_workouts テーブルのtarget_dateを検索する
    monthly_workouts = MonthlyWorkout.where(target_date: Date.new(@year, @month, 1))
    # 検索したtarget_dateを元にworkout名を表示する

    @workout_name_list = monthly_workouts.map do |monthly_workout|
      monthly_workout.workout.name
    end
    # monthly_workouts テーブルのworkout_idからchildren_workouts テーブルのworkout_idを検索する
    monthly_workouts.first.workout.children_workouts.workout_id
    #  検索したworkout_idを元にchildテーブルのnameを表示する
  end
end
