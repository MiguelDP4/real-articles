Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' ,sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'articles/new',              to: 'articles#new'
  get 'articles/:id',              to: 'articles#show', as: :article
  post 'articles/new',             to: 'articles#create'
  post 'articles/:id/vote',        to: 'votes#create'
  patch 'articles/:id/unvote',     to: 'votes#destroy'
  get 'articles',                  to: 'articles#index'
  get 'articles/:id/edit',         to: 'articles#edit'
  patch 'articles/:id',            to: 'articles#update'
end
