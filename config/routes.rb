Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users
  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq) # monitoring console

  root "home#index"
  get 'data_records/index'
  get 'data_records/show'
  get 'data_records/edit'
  get 'data_records/update'

  post 'data_records/import', to: 'data_records#import', as: :import_data_records

  namespace :api do
    namespace :v1 do
      resources :data_records, only: [:index]
    end
  end

end
