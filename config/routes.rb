Rails.application.routes.draw do

  resources :wikis

  devise_for :users

  get 'about' => 'welcome#about'

  authenticated :user do
    root "wikis#index", as: :authenticated_root
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
