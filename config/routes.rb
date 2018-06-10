Rails.application.routes.draw do

  resources :comments
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts
  get 'home/index'

  root 'home#index'

end
