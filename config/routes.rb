Rails.application.routes.draw do
  root to: "recipes#index"
  resources :recipes do
    resources :measures, only: [:create]
  end
  resources :measures, only: [:destroy]
end
