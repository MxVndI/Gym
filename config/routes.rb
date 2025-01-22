Rails.application.routes.draw do
  get "database/connect"
  get "database/disconnect"
  root "home#index"

  resources :memberships
  resources :trainers do
    get 'workouts', on: :member
  end
  resources :workouts
  get 'database/connect', to: 'database#connect', as: :connect_database
  get 'database/disconnect', to: 'database#disconnect', as: :disconnect_database
end