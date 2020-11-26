Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #admin
  devise_for :admin

  namespace :admin do
    resources :homes
    root to: "homes#top"

    resources :genres
    get 'admin/genres' => 'genres#index'

    resources :items
    post 'items/new' => 'items#create'
    get 'items/:id' => 'items#show'
  end

  #public
  root to: "public/homes#top"
  get "/about" => "public/homes#about"

  namespace :public do
  end

end
