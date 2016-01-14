Rails.application.routes.draw do
	get 'sitemap.xml', :to => 'sitemap#index'
  	resources :users, :path=>"usuarios_admin"

    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  	get '/feed', to: 'articles#feed',:format => 'rss'
    devise_for :users
    root 'articles#index'
end
