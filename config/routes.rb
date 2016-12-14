Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources  :users, :only => [:index, :show] do
    member do
      get :following, :followers
    end
  end
  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :genres
    resources :movies
  end
  post "notifications/user_update" => "notifications#user_update"
  put "notifications" => "notifications#seen"
  post "notifications/decline" => "notifications#decline"
  post "notifications/accept" => "notifications#accept"
  put "notifications/show_list" => "notifications#show_list"
  get "notifications/follows" => "notifications#follow_list"
  resources :relationships
  resources :genres, only: :show
  resources :searchs, only: :index
  resources :users
  resources :bookmarks, only: [:index, :create,:destroy]
  resources :movies
  resources :rates, only: :create
  resources :comments, only: [:create, :destroy]
  root "static_pages#home"
  get "about" => "static_pages#about"
end
