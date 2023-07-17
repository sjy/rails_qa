Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq) # monitoring console

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "home#index"

  # get 'data_records/index'
  # get 'data_records/show'
  # get 'data_records/edit'
  # get 'data_records/update'

  # 数据记录
  resources :data_records, only: [:index, :edit, :update, :destroy]

  post "data_records/import", to: "data_records#import", as: :import_data_records

  namespace :api do
    namespace :v1 do
      resources :data_records, only: [:index]
    end
  end
end
