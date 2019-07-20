# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'v1/auth'
  get 'v1/auth/:provider/callback', to: 'omniauth_callbacks#google'

  namespace :v1, constraints: { format: 'json' } do
    resource :sign_up, only: [:create], controller: :sign_up
    resources :cultures
    resources :announcements do
      resources :views, only: [:index, :create], controller: :announcement_views
      resources :comments, except: [:show], controller: :announcement_comments
    end
  end

  resources :heartbeat, only: [:index]
end
