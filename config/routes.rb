Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :companies

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  mount Attachinary::Engine => "/attachinary"

  resources :machines, only: [:index, :new, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
