Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'

  devise_for :users

  resources :messages, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  resources :chat_rooms, only: [:new, :create, :show, :index, :destroy]
  mount ActionCable.server => '/cable'
  root 'chat_rooms#index'

end
