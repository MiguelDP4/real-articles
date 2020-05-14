Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' ,sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'articles/new',              to: 'articles#new'
  get 'articles/:id',              to: 'articles#show', as: :article
  post 'articles/new',             to: 'articles#create'
  patch 'articles/edit/:id',       to: 'articles#update'
  post 'articles/:id',             to: 'votes#create'
  patch 'articles/:id',             to: 'votes#destroy'
end
