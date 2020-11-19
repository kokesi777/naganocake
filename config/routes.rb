Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admin/homes#top'

    #admin
    namespace :admin do
      resources :homes
    end

end
