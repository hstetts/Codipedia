Rails.application.routes.draw do
  get 'about' => 'welcome#about'

  devise_for :users

  authenticated :user do
    root "wikis#index", as: :authenticated_root
  end

  resources :wikis do
    resources :collaborators, only: [:create, :destroy, :index]
  end

  root 'welcome#index'

  resources :charges, only: [:new, :create, :downgrade]
    get "downgrade", to: "charges#downgrade"


end
