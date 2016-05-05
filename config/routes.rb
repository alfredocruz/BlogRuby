Rails.application.routes.draw do
	resources :sitemaps, :only => :index
	get "sitemaps.xml", :controller =>"sitemaps", :action => "xml"
	get '/robots.:format' => 'pages#robots'

	
	get "android_all"=>"articles"
	get "page(/:page)" => "articles#index"
  	resources :users, :path=>"usuarios_admin"
    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  	get '/feed', to: 'articles#feed',:format => 'rss'
    devise_for :users
    root 'articles#index'
end
