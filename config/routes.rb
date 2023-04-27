Rails.application.routes.draw do
  devise_for :users
  root to: "dreams#index"
  resources :dreams, only: [:index, :new, :create, :show, :edit, :update] do
    resources :achieve, only: :create
  end
  resources :users, only: :show
end
