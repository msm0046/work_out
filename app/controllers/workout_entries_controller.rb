class WorkoutEntriesController < ApplicationController
  def index
    @year = params[:year]
    @month = params[:month]

    # 受け取った年月でmonthly_workouts テーブルのtarget_dateを検索する

    # 検索したtarget_dateを元にworkout名を表示する

    # monthly_workouts テーブルのworkout_idからchildren_workouts テーブルのworkout_idを検索する

    #  検索したworkout_idを元にchildテーブルのnameを表示する
  end
end
