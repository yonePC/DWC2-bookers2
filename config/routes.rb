Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users

  resources :books
  resources :users, only: [:index, :show, :edit, :update]

end
