Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :recipes, except: [:index] do
    resources :measures, only: [:new, :create]
  end
  resources :measures, only: [:destroy]
end
