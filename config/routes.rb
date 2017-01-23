Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root "static_pages#home"
  get  "/help",    to: "static_pages#help"
  get  "/about",   to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users
  resources :books
  resources :likes
  resources :comments
  resources :requests
  resources :relationships
  resources :likes
  namespace :admin do
  root "static_pages#home"
  resources :categories, except: :show
  resources :books
  resources :users
  resources :reviews, only: [:index, :show, :destroy, :edit]
  resources :requests
  resources :authors
  resources :publishers
  resources :charts
  end
end
