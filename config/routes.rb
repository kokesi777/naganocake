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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
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
