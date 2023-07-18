Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # TODO: resolve error
  # mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq) # monitoring console

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "home#index"

  # 数据记录
  resources :data_records, only: [:index, :edit, :update, :destroy]

  post "data_records/import", to: "data_records#import", as: :import_data_records

  get "/data_records/:data_record_id/data_record_revisions", to: "data_record_revisions#show"
  resources :data_record_revisions, only: [:index]

  resources :data_records do
    resources :data_record_revisions, only: [:show, :create, :update] do
      member do
        post :review
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :data_records, only: [:index]
    end
  end
end
