Rails.application.routes.draw do

  namespace :api do
  namespace :v1 do
    resources :canvases
    resources :colors
    resources :users
    post '/users', to: 'users#create'
    post '/auth', to: 'authentication#create'
    get '/auth', to: 'authentication#show'
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
