# frozen_string_literal: true

Rails.application.routes.draw do
  resources :follows
  devise_for :users, controllers: { registrations: 'registrations' }
  post '/users/:id/follow', to: 'users#follow', as: 'follow_user'
  post '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'
  resources :tweets do
    resources :likes, only: %i[create destroy]
  end

  root 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
