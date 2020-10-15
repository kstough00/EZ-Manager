Rails.application.routes.draw do
  resources :stages, only: :index
  resources :artists, only: [:index, :create, :new] do
    resources :performances, only: [:index, :new]
  end
  resources :performances, only: :create
end
#   resources :performances, only: :create
#   resources :artists, only: [:index, :create, :new] do
#     resources :performances, only: [:index, :new]
#   end
#   resources :stages, only: :index
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end