Rails.application.routes.draw do

	root "home#index"

  devise_for :users
  resources :tasks, only: [:index]
  scope "manager" do
	  resources :users
	  resources :tasks, except: [:index] do
	  	member do
	  		get :assign
	  		post :assign_activity
	  	end
	  end
	end

	scope "employee" do
    resources :activities		
	end
end
