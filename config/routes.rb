Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :quotes, only: [:index, :new, :create]
  resource :session, only: [:new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "quotes#index"

  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
end
