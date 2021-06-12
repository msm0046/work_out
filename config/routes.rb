Rails.application.routes.draw do
  get 'children_workouts/index'
  # TODO: workout_entries/index は不要なので削除する
  get 'workout_entries/index'
  get 'admin/workouts/monthly/:year/:month', to: 'workout_entries#index'
  post 'admin/workouts/monthly', to: 'workout_entries#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'admin/workouts/next_month', to: 'workout_entries#next_month'
end
