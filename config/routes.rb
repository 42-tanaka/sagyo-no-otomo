Rails.application.routes.draw do
  get 'posts/random'
  get 'posts/my_posts'

  root "tops#index"

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    #sessions: 'sessions'  ログアウト機能はdeviseのみで可能
  }

  resources :posts do
    collection do
      get 'search'
    end
  end
  resource :profile, only: %i[new create edit update show]

end
