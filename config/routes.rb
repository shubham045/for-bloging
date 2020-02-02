Rails.application.routes.draw do
  # devise_for :users


  devise_for :users, controllers: {registrations: 'users/registrations'}

   post '/sign_up/otp', to: 'users/registrations#otp_verification', as: :verify_user_otp

  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles

  root 'welcome#index'

  resources :articles do
  	resources :comments
  end

end
