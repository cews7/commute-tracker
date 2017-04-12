Rails.application.routes.draw do
  root :to => "home#index"
  get '/auth/google/callback', to: 'sessions#create'
  delete '/logout',            to: 'sessions#destroy'
  get '/auth/google',          as: :login
end
