Rails.application.routes.draw do
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
  


  
  #admin
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
}

  namespace :admin do
    resources :homes
    root to: "homes#top"

    resources :genres
    get 'admin/genres' => 'genres#index'

    resources :items
    post 'items/new' => 'items#create'
    get 'items/:id' => 'items#show'
  end

end
