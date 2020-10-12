Rails.application.routes.draw do
  resources :performances
  resources :artists
  resources :stages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
