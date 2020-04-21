Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/new', to: 'users#new', as: 'new_user'
  post 'users/', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
end
