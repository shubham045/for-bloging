Rails.application.routes.draw do
  # devise_for :users


  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles

  root 'welcome#index'

  resources :articles do
  	resources :comments
  end

end
