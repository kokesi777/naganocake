Rails.application.routes.draw do
  #public
    devise_for :publics, controllers: {
      sessions:      'publics/sessions',
      passwords:     'publics/passwords',
      registrations: 'publics/registrations'
  }


  scope module: :public do
      resources :items, only: [:index, :show]
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  

  root to: "public/homes#top"
  get "/about" => "public/homes#about"

  get 'end_users/my_page' => "public/end_users#show"
  get 'end_users/unsubscribe' => "public/end_users#unsubscribe"
  get 'end_users/edit' => "public/end_users#edit"


  #admin
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
}

  namespace :admin do
    root to: "homes#top"

    resources :genres

    resources :items
    post 'items/new' => 'items#create'
    get 'items/:id' => 'items#show'

    resources :end_users, only: [:index, :show, :edit, :update]

  end

end
