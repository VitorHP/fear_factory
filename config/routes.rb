Fate::Application.routes.draw do

  scope "/(:locale)", locale: /en|pt-BR/ do
    devise_for :users, skip: :omniauth_callbacks

    resources :campaigns, only: [:index, :new] do
      resources :characters
      resources :skill_groups
    end

    root to: 'home#index'
  end

  devise_for :users, only: :omniauth_callbacks, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/:locale' => 'home#index'
end
