Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users
  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :genres
    resources :movies
  end 
  resources :users
  resources :movies
  resources :comments, only: [:create, :destroy]
  root "static_pages#home"
  get "about" => "static_pages#about"  
end
