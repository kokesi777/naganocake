Rails.application.routes.draw do
  # devise_for :end_users
  #public

  root to: "public/homes#top"
  get "/about" => "public/homes#about"

  devise_for :end_users, controllers: {
      sessions:      'public/end_users/sessions',
      passwords:     'public/end_users/passwords',
      registrations: 'public/end_users/registrations'
  }

  scope module: :public do
      resources :items, only: [:index, :show]
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
      resources :end_users, only: [:edit, :update]
  end
  
  get "end_users/my_page" => "public/end_users#show"
  get 'end_users/unsubscribe' => "public/end_users#unsubscribe"
  

  #admin
  devise_for :admins, controllers: {
    sessions:      'admin/admins/sessions',
    passwords:     'admin/admins/passwords',
    registrations: 'admin/admins/registrations'
}

  namespace :admin do
    root to: "homes#top"

    resources :genres

    resources :items
    post 'items/new' => 'items#create'

    resources :end_users, only: [:index, :show, :edit, :update]

  end

end
