Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: "dreams#index"
  resources :dreams, only: [:index, :new, :create, :show, :edit, :update] do
    resources :achieves, only: [:index, :create]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit] do
    resource :friends, only: [:create, :destroy]
  end
end
