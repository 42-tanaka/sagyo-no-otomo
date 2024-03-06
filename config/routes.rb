Rails.application.routes.draw do
  get 'posts/random'
  get 'posts/my_posts'
  get 'terms_of_service', to: 'tops#terms_of_service'
  get 'privacy_policy', to: 'tops#privacy_policy'

  patch 'users/update_notification_settings', to: 'users#update_notification_settings', as: 'update_notification_settings'

  root "tops#show"

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    sessions: 'users/sessions'
  }

  resources :posts do
    resources :comments
    collection do
      get :likes
    end
  end

  resources :likes, only: %i[create destroy]
  resource :profile, only: %i[new create edit update show]

end
