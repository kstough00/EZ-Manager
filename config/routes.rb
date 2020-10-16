Rails.application.routes.draw do
  resources :stages
  resources :artists, only: [:index, :create, :new] do
    resources :performances, only: [:index, :new]
  end
  resources :performances, only: :create
  get '/stages/large', to: 'stages#large'
  get '/stages/small', to: 'stages#small'
end
