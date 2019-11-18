Rails.application.routes.draw do
  resources :themes
  resources :decks
  devise_for :users
  get '/search', to: 'decks#index'
  get '/dashboard', to: 'themes#index'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
