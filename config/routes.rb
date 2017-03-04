Rails.application.routes.draw do
	resources :users
  resources :tasks
  devise_for :users
end
