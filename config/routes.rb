Rails.application.routes.draw do

  resources :wikis

  devise_for :users

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

  authenticated :user do
    root "wikis#index", as: :authenticated_root
  end

  root 'welcome#index'

end
