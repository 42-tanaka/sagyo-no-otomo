Rails.application.routes.draw do
  root "tops#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    #sessions: 'sessions'  ログアウト機能はdeviseのみで可能
  }

  resources :posts
  resource :profile, only: %i[new create edit update show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
