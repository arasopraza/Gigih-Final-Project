Rails.application.routes.draw do
  resources :order_details
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "menus#index"
  resources :menus
  resources :orders
  resources :categories
  resources :item_categories
  resources :customers
  get 'reports', to: 'orders#report_order', as: :reports
end
