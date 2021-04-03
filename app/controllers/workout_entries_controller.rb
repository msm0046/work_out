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
      monthly_workouts.inject(injection_hash) do |hash, monthly_workout|
        hash[monthly_workout.workout] << monthly_workout.child.name
        hash
      end
  end

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
