Rails.application.routes.draw do
  devise_for :users
  root to: "dreams#index"
  resources :dreams, only: [:index, :new, :create, :show, :edit]
  resources :users, only: :show
end
