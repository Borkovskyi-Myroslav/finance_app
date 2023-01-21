Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/index/:some_param', to: 'reports#index', prm: 'the prm'

  get 'reports/report_by_category'
  get 'reports/report_by_category/:some_param', to: 'reports#report_by_category', prm: 'the prm_2'

  get 'reports/report_by_dates'
  get 'reports/report_by_dates/:some_param', to: 'reports#report_by_category', prm: 'the prm_3'

  get 'mains/index'
  get 'mains/index/:some_param', to: 'mains#index', prm: 'the prm_4'
  
  resources :operations
  resources :categories

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
