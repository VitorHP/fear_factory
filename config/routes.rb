Fate::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :home, only: [:index]
  resources :characters

  root to: 'characters#index'
end
