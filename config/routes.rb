Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  resources :subscribes, only: :create
  namespace :admin do
  	resources :subscribes, except: :create
  end
end
