Rails.application.routes.draw do
  get 'responses/create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :responses, only: [:create]
  resources :questionnaires, only: [:show, :create]
end
