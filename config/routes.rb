require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :schedulings
    resources :orders
    resources :campaigns
    resources :discounts
    resources :services
    resources :products
    resources :suppliers
    resources :clients
  end
  # mount Fae below your admin namespec
  mount Fae::Engine => '/admin'

  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
end
