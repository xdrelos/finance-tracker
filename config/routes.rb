Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users, controllers: {registrations: :registrations}
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_portfolio/search-stock', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'
  get 'my_friends/search-friend', to: 'users#search'

end
