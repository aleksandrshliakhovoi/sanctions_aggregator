Rails.application.routes.draw do
  root to: 'people#index'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :people, only: [:index], concerns: :paginatable
end
