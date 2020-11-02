Rails.application.routes.draw do
  root "pictures#index"
  resources :pictures, only: [:new, :create, :destroy] do
    collection do
      get 'post'
    end
  end
  get "pictures/show", action: :show, controller: 'pictures'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
