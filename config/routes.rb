Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :responses, only: [:create]
  resources :reports, only: [:create]
  resources :questionnaires, only: [:show, :create]
end
