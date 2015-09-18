Rails.application.routes.draw do
  	resources :users, :path=>"usuarios_admin"

    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  
    devise_for :users, controllers: { 
  		registrations: "users/registrations",
  		sessions: "users/sessions",
  		passwords: "users/passwords",
  		omniauth_callbacks: "users/omniauth_callbacks"
	}
    root 'articles#index'
end
