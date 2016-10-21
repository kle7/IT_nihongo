Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users
  namespace :admin do
    root "static_pages#home"
    resources :genres
    resources :movies
  end 
  resources :users
  root "static_pages#home"
  get "about" => "static_pages#about"  
end
