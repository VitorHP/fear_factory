Fate::Application.routes.draw do

  scope "/(:locale)", locale: /en|pt-BR/ do
    devise_for :users, skip: :omniauth_callbacks

    resources :characters
    resources :campaigns

    root to: 'characters#index'
  end

  devise_for :users, only: :omniauth_callbacks, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/:locale' => 'characters#index'
end
