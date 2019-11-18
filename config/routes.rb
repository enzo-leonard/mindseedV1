Rails.application.routes.draw do
  get 'themes/index'
  get 'themes/new'
  get 'themes/create'
  get 'themes/edit'
  get 'themes/update'
  get 'themes/delete'
  resources :decks
  devise_for :users
  get '/search', to: 'decks#index'
  get '/dashboard', to: 'themes#index'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
