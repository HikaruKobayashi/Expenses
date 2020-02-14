Rails.application.routes.draw do
  root to: 'landing_pages#index'
  resources :landing_pages
  get "/setting" => "landing_pages#setting"
  get "/report" => "landing_pages#report"

  resources :incomes
  resources :variable_costs
  resources :fixed_costs
end