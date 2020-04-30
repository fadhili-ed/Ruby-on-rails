# frozen_string_literal: true

Rails.application.routes.draw do
  get 'statics/home'
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  # root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/new', to: 'users#new', as: 'new_user'
  post 'users/', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'

  get 'deposits/new', to: 'deposits#new', as: 'new_deposit'
  post 'deposits/', to: 'deposits#create'
  get 'deposits/:id', to: 'deposits#show', as: 'deposit'

  get '/withdrawals/new', to: 'withdrawals#new', as: 'new_withdrawal'
  post 'withdrawals/', to: 'withdrawals#create'

  get 'send/new', to: 'sends#new', as: 'new_send'
  post 'send/new', to: 'sends#create'
  get 'send/:id', to: 'sends#show', as: 'send'
  root to: 'statics#home'
end
