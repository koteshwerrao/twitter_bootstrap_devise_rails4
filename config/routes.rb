Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "user/registrations",
                                      :confirmations => 'user/confirmations'}
  root 'home#index'
  resources :secret_codes
end
