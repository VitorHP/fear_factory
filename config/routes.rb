Fate::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope "/(:locale)", locale: /en|pt-BR/ do
    resources :characters
  end

  get '/:locale' => 'characters#index'
  root to: 'characters#index'
end
