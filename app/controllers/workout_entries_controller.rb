class WorkoutEntriesController < ApplicationController
  def index
    @year = params[:year]
    @month = params[:month]

    # 受け取った年月でmonthly_workouts テーブルのtarget_dateを検索する
    monthly_workouts = MonthlyWorkout.where(target_date: Date.new(@year.to_i, @month.to_i, 1))
    # 検索したtarget_dateを元にworkout名を表示する

    workout_name_list = monthly_workouts.map do |monthly_workout|
      monthly_workout.workout.name
    end
    # monthly_workouts テーブルのworkout_idからchildren_workouts テーブルのworkout_idを検索する
    # NOTE: monthly_workouts は配列。MonthlyWorkout レコードがゼロ個以上含まれている
    children_workouts = children_workouts_from(monthly_workouts)

    #  検索したworkout_idを元にchildテーブルのnameを表示する
    children_name_list = children_name_list_from(children_workouts)
    # flatten メソッド: [ [:a], [:b, :c], [:d, [:e]]].flatten # => [:a, :b, :c, :d, :e]
  end

  # TODO: 今月のワークアウト名に対して、どの児童が対応しているか、データの対応付けをする

  # TODO: JavaScript でワークアウト名の自動保存する

  private

  def children_name_list_from(children_workouts)
    children_workouts.flatten.map do |children_workout|
      children_workout.child.name
    end
  end

  def children_workouts_from(monthly_workouts)
    monthly_workouts.map do |monthly_workout|
      ChildrenWorkout.where(workout_id: monthly_workout.workout_id)
    end
  end
end
