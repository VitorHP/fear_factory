Fate::Application.routes.draw do
  devise_for :users
  resources :home, only: [:index]
  resources :characters

  root to: 'home#index'
end
