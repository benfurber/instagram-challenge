Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts
  get 'home/index'

  root 'home#index'

end
