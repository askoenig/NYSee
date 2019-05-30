Rails.application.routes.draw do
  root 'application#hello'
  resources :custom_visits
  resources :custom_destinations
  resources :creators
  resources :visits
  resources :creations
  resources :destinations
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
