Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips
  get '/trips/new', to: 'trips#new_second', as: 'new_second'
  get '/trips/new', to: 'trips#new_third', as: 'new_third'

  resources :trips do
    resources :flights
  end

  resources :trips do
    resources :accommodations
  end

  resources :trips do
    resources :companions, only: %i[show]
  end
end
