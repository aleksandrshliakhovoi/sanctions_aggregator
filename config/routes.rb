require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  root to: 'people#index'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :people, only: [:index], concerns: :paginatable
  resources :subscriptions, only: [:index, :create, :destroy], concerns: :paginatable

  devise_for :users
end
