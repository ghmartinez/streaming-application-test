Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :movies, only: [:index, :show] do
    resources :purchases, only: [:create]
  end

  resources :seasons, only: [:index, :show] do
    resources :purchases, only: [:create]
  end

  resources :contents, only: [:index]

  resources :purchase_options, only: [:index]
end
