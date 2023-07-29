Rails.application.routes.draw do
  get 'poducts/index'
  get 'poducts/show'
  devise_for :users
  root to: "pages#home"

  get "chat", to: "bookings#chat"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  # a regular user can see the bookings they've made
  resources :bookings, only: [:show, :index, :update]

  # an owner can see all the bookings for their products
  namespace :owners do
    resources :bookings, only: [:index, :show]
    # equivalent to => get '/owners/bookings', to: 'owners/bookings#index'
  end
end
