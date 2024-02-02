Rails.application.routes.draw do
  get 'posts/random'
  get 'posts/my_posts'

  patch 'users/update_notification_settings', to: 'users#update_notification_settings', as: 'update_notification_settings'

  root "tops#index"

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    sessions: 'users/sessions'
  }

  resources :posts do
    collection do
      get 'search'
    end
  end
  resource :profile, only: %i[new create edit update show]

end
