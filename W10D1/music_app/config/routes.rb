Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :destroy, :show]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:index]
end

