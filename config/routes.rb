Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #admin
  devise_for :admins  

    namespace :admin do
      root 'homes#top'
      root 'genres#index'
      resources :homes
    end

end
