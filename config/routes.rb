Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' ,sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'articles/:id',              to: 'articles#show', as: :article
  get 'articles/:id',              to: 'articles#create'
  get 'articles/:id',              to: 'articles#update'
end
