Rails.application.routes.draw do
	get "sitemap" => "sitemaps#show"
	get "/android/#{:id}/edit" => "articles#edit"
  	resources :users, :path=>"usuarios_admin"
    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  	get '/feed', to: 'articles#feed',:format => 'rss'
    devise_for :users
    root 'articles#index'
end
