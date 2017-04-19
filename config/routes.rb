Rails.application.routes.draw do
  root :to => "dashboard#index"

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/google_oauth2',          as: :login
  delete '/logout',                   to: 'sessions#destroy'

  resources :trips, only: [:new, :create, :show, :destroy]
end
