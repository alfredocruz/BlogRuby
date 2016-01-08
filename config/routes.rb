Rails.application.routes.draw do
  	resources :users, :path=>"usuarios_admin"

    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  	get 'feed' => 'articles#feed'
    devise_for :users
    root 'articles#index'
end
