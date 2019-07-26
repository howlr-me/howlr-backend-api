# frozen_string_literal: true
require 'api_constraints'

Rails.application.routes.draw do
  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    mount_devise_token_auth_for 'User', at: 'auth'
    get 'auth/:provider/callback', to: 'omniauth_callbacks#google'

    resource :sign_up, only: [:create], controller: :sign_up
    resources :cultures
    resources :announcements do
      resources :views, only: [:index, :create], controller: :announcement_views
      resources :comments, except: [:show], controller: :announcement_comments
    end
  end

  resources :heartbeat, only: [:index]
end
