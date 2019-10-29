Rails.application.routes.draw do
  resources :feelings
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'feelings#index'
end
