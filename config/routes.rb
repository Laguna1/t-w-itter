# frozen_string_literal: true

Rails.application.routes.draw do
  resources :follows
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :tweets do
    resources :likes, only: %i[create destroy]
  end

  root 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
