Rails.application.routes.draw do
	resources :sitemaps, :only => :show
	get "/sitemap.xml", :controller=>"sitemaps",:actions=> "show", :format=>:xml

	get "android_all"=>"articles"
	get "page(/:page)" => "articles#index"
	get "sitemap" => "sitemaps#show"
  	resources :users, :path=>"usuarios_admin"
    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  	get '/feed', to: 'articles#feed',:format => 'rss'
    devise_for :users
    root 'articles#index'
end
