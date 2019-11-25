Rails.application.routes.draw do
  resources :themes do
    resources :decks, only: [ :index, :new, :create ] do
    resources :cards
    end
  end
  resources :decks, only: [ :show, :edit, :update, :destroy ] do
    post '/import', to: 'decks#import'
    resources :cards
  end
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/search', to: 'decks#search'
  get '/dashboard', to: 'themes#index'
  get '/learn', to: 'themes#learn'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
