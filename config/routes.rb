Wod::Application.routes.draw do

  scope "/(:locale)", locale: /en|pt-BR/ do
    devise_for :users, skip: :omniauth_callbacks

    resources :characters, only: [:new, :create, :edit, :update, :show]

    root to: 'home#index'
  end

  devise_for :users, only: :omniauth_callbacks, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/:locale' => 'home#index'
end
