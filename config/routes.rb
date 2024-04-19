# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'
  get '/rules', to: 'pages#rules'
  
  resources :warriors, only: [:new, :create, :show]
  resources :fights, only: [:new, :create, :index, :show]
end
