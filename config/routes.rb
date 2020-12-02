Rails.application.routes.draw do

  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  #public
    devise_for :publics, controllers: {
      sessions:      'publics/sessions',
      passwords:     'publics/passwords',
      registrations: 'publics/registrations'
  }

  namespace :public do
    get 'homes/top'
    get 'homes/about'
    
  end

  root to: "public/homes#top"
  get "/about" => "public/homes#about"

  get 'end_users/my_page' => "public/end_users#show"
  get 'end_users/unsubscribe' => "public/end_users#unsubscribe"
  get 'end_users/edit' => "public/end_users#edit"

 
  get '/addresses' => "public/addresses#index"
  get '/addresses/:id/edit' => "public/addresses#edit"
  post '/addresses' => "public/addresses#create"
  patch '/addresses/:id' => "public/addresses#update"
  delete '/addresses/:id' => "public/addresses#destroy"

  get '/items' => "public/items#index"
  
  #admin
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
}

  namespace :admin do
    root to: "homes#top"

    resources :genres
    get 'admin/genres' => 'genres#index'

    resources :items
    post 'items/new' => 'items#create'
    get 'items/:id' => 'items#show'

    resources :end_users, only: [:index, :show, :edit, :update]
  end

end
