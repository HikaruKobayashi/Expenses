Rails.application.routes.draw do
  root to: 'landing_pages#index'
  resources :landing_pages
  resources :incomes
  resources :variable_costs
  resources :fixed_costs
end