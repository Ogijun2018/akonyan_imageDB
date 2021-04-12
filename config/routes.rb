Rails.application.routes.draw do
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', :as => :logout
  root "pictures#index"
  resources :pictures, only: [:new, :create, :destroy] do
    collection do
      get 'post'
    end
  end
  get "pictures/:id", action: :show, controller: 'pictures'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
