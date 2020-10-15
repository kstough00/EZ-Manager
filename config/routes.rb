Rails.application.routes.draw do
  resources :stages, only: [:index, :create, :new]
  resources :artists, only: [:index, :create, :new] do
    resources :performances, only: [:index, :new]
  end
  resources :performances, only: :create
  get '/stages/large', to: 'stages#large'
  get '/stages/small', to: 'stages#small'
end
#   resources :performances, only: :create
#   resources :artists, only: [:index, :create, :new] do
#     resources :performances, only: [:index, :new]
#   end
#   resources :stages, only: :index
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end