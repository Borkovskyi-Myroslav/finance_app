Rails.application.routes.draw do
  # get 'reports/index'
  # get 'reports/index', to: 'reports#index'
  #

  #
  #  get 'mains/index'
  # get 'mains/index', to: 'mains#index'
  root "mains#index"

  resources :reports, only: [:index] do
    collection do
      get :analytics
    end
  end

  resources :operations
  resources :categories
  resources :mains

  # resources :reports, only: [:index] do
  #   collection do
  #     get :report_by_category
  #     get :report_by_dates
  #     get :analytics
  #   end
  # end
  #

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
