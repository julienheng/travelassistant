Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips do
    resources :companions, only: %i[show new create]
    resources :flights
    resources :accommodations
    resources :companions, only: %i[show]
    get :activites
  end

  get "loading/", to: "pages#loading", as: :loading_page
  get "trip-generate/", to: "pages#generate", as: :generate_page
end
