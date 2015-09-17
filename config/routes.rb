Rails.application.routes.draw do
  resources :users 

    resources :tags, :path => "category"
  resources :articles, :path => "android"
  
    devise_for :users, path:"usuarios", path_names: { sign_in: 'iniciar_sesion', sign_up: 'crear_cuenta' }
    root 'articles#index'
end
