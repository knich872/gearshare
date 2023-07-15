Rails.application.routes.draw do
  get 'poducts/index'
  get 'poducts/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index, :show]
  namespace :owners do
    resources :bookings, only: :index
    # equivalent to => get '/owners/bookings', to: 'owners/bookings#index'
  end
end
