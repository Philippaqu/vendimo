Rails.application.routes.draw do
  resources :machines
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :machines, only: [ :index, :show ]
    end
  end
  root to: 'pages#home'
  devise_for :companies

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    as :user do
      get 'balance', to: 'payments#balance'
      resources :payments, only: [:new, :create]
    end
  mount Attachinary::Engine => "/attachinary"
end
