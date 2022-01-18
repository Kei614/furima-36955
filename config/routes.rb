Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items do
    resources :purchase_records ,only: [:index, :create]
  end
end
