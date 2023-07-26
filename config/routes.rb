Rails.application.routes.draw do
  root to: "pages#home"

  resources :movies, only: [:index, :show]
  resources :seasons, only: [:index, :show]
end
