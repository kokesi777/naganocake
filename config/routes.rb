Rails.application.routes.draw do

  # devise_for :end_users
  # public

  root to: "public/homes#top"
  get "/about" => "public/homes#about"

  devise_for :end_users, controllers: {
      sessions:      'public/end_users/sessions',
      passwords:     'public/end_users/passwords',
      registrations: 'public/end_users/registrations'
  }

  get 'orders/complete' => 'public/orders#complete', as: "complete"
  patch "end_users/withdraw" => "public/end_users#withdraw"
  get "end_users/my_page" => "public/end_users#show"
  get 'end_users/unsubscribe' => "public/end_users#unsubscribe"
  
  scope module: :public do
      resources :items, only: [:index, :show]
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
      resources :end_users, only: [:edit, :update]
      resources :cart_items, only: [:index, :update, :destroy, :create]
      resources :orders, only: [:new, :create, :show, :index]
  end

  post 'orders/confirm' => 'public/orders#confirm'


  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  

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

    resources :orders, only: [:index, :show, :update]

  end

end
