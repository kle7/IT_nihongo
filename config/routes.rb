Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root "static_pages#home"
  end 

  root "static_pages#home"
  get "about" => "static_pages#about"  
end
