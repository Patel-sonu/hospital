Rails.application.routes.draw do
  resources :doctors
  resources :patients
  resources :appointments
  # root 'doctors#index'
  post 'doctors/login', to: 'doctors#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
