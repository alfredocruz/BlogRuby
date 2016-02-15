Rails.application.routes.draw do
	get "android_all"=>"articles"
	get "page(/:page)" => "articles#index"
	get "sitemap" => "sitemaps#show"
  	resources :users, :path=>"usuarios_admin"
    resources :tags, :path => "category"
  	resources :articles, :path => ""
  	get '/feed', to: 'articles#feed',:format => 'rss'
    devise_for :users
    root 'articles#index'
end
