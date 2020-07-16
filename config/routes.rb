Rails.application.routes.draw do
  root 'page#index'
  resources :flights
  resources :airports do
    get :search, on: :collection
  end
  resources :bookings
  resources :passengers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
