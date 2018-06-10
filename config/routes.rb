Rails.application.routes.draw do

  devise_for :users
  resources :posts
  get 'home/index'

  root 'home#index'

end
