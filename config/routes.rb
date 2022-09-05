Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips do
    resources :companions, only: %i[show new create]
    resources :activites
    resources :flights
    resources :accommodations

    member do
      get 'activities/new', to: 'trips#activities'
    end

    resources :attractions, only: [:create]
    resources :restaurants, only: [:create]
  end

  resources :chats, only: :show do
    resources :messages, only: :create
  end

  #get "pages/", to: "pages#generate", as: :generate_page
  get "pages/dashboard", to: "pages#dashboard", as: :dashboard_page
  get "loading/", to: "pages#loading", as: :loading_page
  get "trip-generate/", to: "pages#generate", as: :generate_page
end
