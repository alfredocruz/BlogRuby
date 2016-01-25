Rails.application.routes.draw do
	get "page(/:page)" => "articles#index"
	get "sitemap" => "sitemaps#show"
  	resources :users, :path=>"usuarios_admin"
    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  	get '/feed', to: 'articles#feed',:format => 'rss'
    devise_for :users
    root 'articles#index'
end
