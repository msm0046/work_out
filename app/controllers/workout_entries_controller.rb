class WorkoutEntriesController < ApplicationController
  def index
    @year = params[:year]
    @month = params[:month]

    target_date = Date.new(@year.to_i, @month.to_i, 1)
    this_month = (target_date..target_date.end_of_month)

    monthly_workouts =
      MonthlyWorkout.where(
        target_date: this_month
      )

    injection_hash = Hash.new { |hash, key| hash[key] = [] }

    @workout_grouped_children =
      monthly_workouts.each_with_object(injection_hash) do |monthly_workout, hash|
        hash[monthly_workout.workout] << monthly_workout.child&.name
      end
  end

  # キー値は String, Symbol 以外に クラスのインスタンスも設定できる
  # hash["string_key"]
  # hash[:symbol_key]
  # hash[monthly_workout] << :foo

  # MonthlyWorkout に児童の ID を割り当てる
  # monthly_workout = MonthlyWorkout.first
  # child = Child.first
  # monthly_workout.child_id = child.id
  # monthly_workout.save

  walking
  def update
    # パラメータを参照する
    workout = Workout.find(params[:id])

    # パラメータの値を使って Workout レコードを検索して取り出す
    # 取り出したレコードのワークアウト名を更新する
    workout.update(name: params[:workout_name])

    # TODO: 適当なリダイレクト先を設定する
    redirect_to '/admin/workouts/monthly/2021/2'
  end
end
