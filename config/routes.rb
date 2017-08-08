Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "users#home", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "pages#welcome"
  end
  get 'pages/welcome', as: 'welcome'

  resources :sessions, only: [:create]
  resources :users
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
