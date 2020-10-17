Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/stages/large', to: 'stages#stages_large'
  get '/stages/small', to: 'stages#stages_small'
  resources :stages
  resources :artists do
    resources :performances, only: [:index, :new, :create]
  end
  resources :performances, only: [:index, :new, :create]

  root to: 'application#home'
  get '/auth/:provider/callback', to: 'sessions#create'
end
