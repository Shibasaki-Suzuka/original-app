Rails.application.routes.draw do
  devise_for :users
 root to: "dreams#index"
end
