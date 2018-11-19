Rails.application.routes.draw do
  devise_for :users
  root 'billboards#index'

  resources :artists
  resources :billboards do
    resources :songs, only: [:index, :new, :create, :destroy]
  end
end
