Rails.application.routes.draw do
  resources :periodization_years
  resources :periodization_weeks
  resources :periodization_cycles
  resources :settings
  resources :tests
  resources :goals
  resources :workouts
  root to: "workouts#index"

  match 'tsscalc' => 'pages#index', via: :all
  match 'pmc' => 'pages#pmc', via: :all
  match 'atp' => 'pages#atp', via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
