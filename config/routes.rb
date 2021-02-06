Rails.application.routes.draw do
  get 'workout_entries/index'
  get 'admin/workouts/monthly/:year/:month', to: 'workout_entries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
