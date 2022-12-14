Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get 'users_options' => 'pages#users_options'
  get 'searcher' => 'pages#searcher'
  get 'filter' => 'pages#filter'
end
