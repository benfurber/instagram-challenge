Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do
    resources :comments
  end

  resources :comments

  get 'home/index'

  root 'home#index'

end
