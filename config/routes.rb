Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips

  resources :trips do
    resources :companions, only: %i[show new create]
  end

  resources :trips do
    resources :flights
  end

  resources :trips do
    resources :accommodations
  end

  resources :trips do
    resources :companions, only: %i[show]
  end

  get "pages/", to: "pages#generate", as: :generate_page
end
