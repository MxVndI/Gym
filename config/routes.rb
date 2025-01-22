Rails.application.routes.draw do
  root "home#index"

  resources :memberships
  resources :trainers do
    get 'workouts', on: :member
  end
  resources :workouts
end