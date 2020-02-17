Rails.application.routes.draw do
  root to: 'landing_pages#index'
  resources :landing_pages
  get "/report" => "landing_pages#report"

  resources :incomes
  get "/incomes/new" => "incomes#new"
  get "/incomes_report" => "incomes#report"
  resources :variable_costs
  get "/variable_costs_report" => "variable_costs#report"
  resources :fixed_costs
  get "/fixed_costs_report" => "fixed_costs#report"

  resources :save
  get "/saves_report" => "save#report"

  get '/inquiry' => 'inquiry#index'
  post '/inquiry/confirm' => 'inquiry#confirm'
  post '/inquiry/thanks' => 'inquiry#thanks'

  # ルーティングエラー時の処理
  get "*path" => 'landing_pages#index'
end