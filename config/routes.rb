Rails.application.routes.draw do
	resources :sitemap, :only => :index
	get "sitemap.xml", :controller =>"sitemap", :action => "xml"
	get '/robots.:format' => 'pages#robots'


	get "android_all"=>"articles"
	get "page(/:page)" => "articles#index"
  	resources :users, :path=>"usuarios_admin"
    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  	get '/feed', to: 'articles#feed',:format => 'rss'
    devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout',sign_up: 'registration' }
    root 'articles#index'
end
