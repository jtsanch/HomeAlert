Rails.application.routes.draw do
  
  get "log_in"  => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" =>  "users#new", :as => "sign_up"
  
  root :to => "users#new"
  
  resources :users
  resources :sessions

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

end
