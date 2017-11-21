Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :companies
  devise_for :users

  mount Attachinary::Engine => "/attachinary"

  resources :machines, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
