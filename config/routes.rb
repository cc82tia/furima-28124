Rails.application.routes.draw do
  devise_for :users
  root  to: 'items#index'
  resources :items do
    resources :orders, only:[:create, :index, :new]
  end
  post 'items/:id' => 'items#show'
  post 'items/:id' => 'orders#index'
  
end
