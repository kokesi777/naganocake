Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :admin

  #admin
  namespace :admin do
    resources :homes
    root to: "homes#top"

    resources :genres
    get 'admin/genres' => 'genres#index'

    resources :items
    post 'items/new' => 'items#create'
  end

end
