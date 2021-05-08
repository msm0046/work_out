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

    # TODO: 来月の表示について、日本語で書き起こしてみる
    # * 次の月を表示させる
    @next_month = Date.new(@year.to_i, @month.to_i, 1).next_month

    # HINT: 「今月」"より大きい" MonthlyWorkout レコードを検索する
    # MEMO: 「?」はプレースホルダ
    @next_month_workouts = MonthlyWorkout.where('target_date > ?', target_date.end_of_month)
    # SELECT * FROM MonthlyWorkout
    # WHERE MonthlyWorkout.target_date > 2021-05-31

    # TODO: 来月分のワークアウト表示について、「ワークアウト名」「入力フォーム」を表示させる
    # TODO: データベースからワークアウトを呼び出す (来月分)
    # @next_month_workouts = [
    #   Workout.new(name: 'なわとび'),
    #   Workout.new(name: 'おにごっこ'),
    #   nil
    # ]

    # TODO: @next_month_workouts の要素数が 3つ じゃなかったら、3つになるまで nil を挿入する
    # 3 未満 : (1..2)
    # 3 以下 : (1..3)
    loop do
      # 空のときは .to_a が使えるかも...?
      # 「空のとき」の条件追加が必要
      if @next_month_workouts.to_a.size.zero?
        @next_month_workouts = [nil, nil, nil]
      end
      if @next_month_workouts.size < 3
        @next_month_workouts.push(nil)
      else
        break
      end
    end
  end

  # {
  #   workout_1: %w[A B],
  #   workout_2: ['C'],
  #   workout_3: []
  # }
  # キー値は String, Symbol 以外に クラスのインスタンスも設定できる
  # hash["string_key"]
  # hash[:symbol_key]
  # hash[monthly_workout] << :foo

  # MonthlyWorkout に児童の ID を割り当てる
  # monthly_workout = MonthlyWorkout.first
  # child = Child.first
  # monthly_workout.child_id = child.id
  # monthly_workout.save

  def update
    # パラメータを参照する
    workout = Workout.find(params[:id])

    # パラメータの値を使って Workout レコードを検索して取り出す
    # 取り出したレコードのワークアウト名を更新する
    workout.update(name: params[:workout_name])

    # TODO: 適当なリダイレクト先を設定する
    redirect_to '/admin/workouts/monthly/2021/2'
  end

  def next_month
    workout_name = params[:workout_name]

    # HINT: find_or_create メソッドで検索・作成をすると、重複レコードが作成されない、better な処理が記述できる
    workout = Workout.new(name: workout_name)
    workout.save

    # FIXME: 児童の ID 設定が必要だが、取得・設定する方法がない
    next_month = Date.new(Date.current.year, Date.current.month, 1).next_month
    MonthlyWorkout.create!(
      workout_id: workout.id,
      target_date: next_month,
      child_id: Child.first.id # エラー回避の一時的な措置
    )

    # monthly_workout = MonthlyWorkout.new(target_date: next_month)
  end
end
