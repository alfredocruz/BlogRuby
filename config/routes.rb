Rails.application.routes.draw do
	get "sitemap" => "sitemaps#show"
  	resources :users, :path=>"usuarios_admin"
  	get "pagina(:page)",to:"articles#index"
    resources :tags, :path => "category"
  	resources :articles, :path => "android"
  	get '/feed', to: 'articles#feed',:format => 'rss'
    devise_for :users
    root 'articles#index'
end
