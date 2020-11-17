Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  
  root to: "items#index"
  resources :items do
    root to: 'purchases#index'
    resources :purchases, only:[:index, :create]
  end
  resources :users, only: :show

end
