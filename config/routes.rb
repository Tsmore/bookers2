Rails.application.routes.draw do
  get 'users/new'
  get 'users/index'
  get 'users/edit'
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
