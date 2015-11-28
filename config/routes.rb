Fate::Application.routes.draw do

  scope "/(:locale)", locale: /en|pt-BR/ do
    devise_for :users, skip: :omniauth_callbacks

    resources :characters, only: [:new]

    # resources :campaigns, except: [:index] do
    #   resources :characters, except: [:index]
    # end

    # resources :custom_skill_groups
    resources :house_rules do
      collection do
        get :tags
        get :tag_cloud
      end
      member do
        post :like
        post :comment
        post :favorite
        delete :uncomment
      end
    end

    get '/profile', to: 'home#profile', as: :profile
    root to: 'home#index'
  end

  devise_for :users, only: :omniauth_callbacks, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/:locale' => 'home#index'
end
