Rails.application.routes.draw do
  resources :banks, only: [:show], path: '' do
    resources :smes , only: [:new, :create, :show]
    get 'lookup_abn', to: 'banks#lookup_abn'
    get 'lookup_bsb', to: 'banks#lookup_bsb'
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
