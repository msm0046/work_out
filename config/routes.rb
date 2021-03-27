Rails.application.routes.draw do
  # TODO: workout_entries/index は不要なので削除する
  get 'workout_entries/index'
  get 'admin/workouts/monthly/:year/:month', to: 'workout_entries#index'
  post 'admin/workouts/monthly', to: 'workout_entries#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
