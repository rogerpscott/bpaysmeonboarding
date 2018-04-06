Rails.application.routes.draw do
  resources :banks, only: [:show], path: '' do
    resources :smes , only: [:new, :create, :show]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
