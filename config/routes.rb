Rails.application.routes.draw do
  devise_for :users
  namespace :user_backoffice, path: :principal do
    get 'homes/index'
    resources :yields, path: :rendimentos
  end
  root to: 'user_backoffice/homes#index'
end