Rails.application.routes.draw do
  get '/stages/large', to: 'stages#stages_large'
  get '/stages/small', to: 'stages#stages_small'
  resources :stages
  resources :artists do
    resources :performances, only: [:index, :new]
  end
  resources :performances, only: :create

  root to: 'application#home'
end
