Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :landing_pages
  get "/report" => "landing_pages#report"

  resources :incomes
  get "/incomes_report" => "incomes#report"
  resources :variable_costs
  get "/variable_costs_report" => "variable_costs#report"
  resources :fixed_costs
  get "/fixed_costs_report" => "fixed_costs#report"
  resources :deposits
  get "/deposits_report" => "deposits#report"

  get '/inquiry' => 'inquiry#index'
  post '/inquiry/confirm' => 'inquiry#confirm'
  post '/inquiry/thanks' => 'inquiry#thanks'

  get '/login' => 'sessions#new'
  post '/login'=> 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/users' => 'users#new'
  post '/users'=> 'users#create'
  delete '/users' => 'users#destroy'

  # ルーティングエラー時の処理
  get "*path" => 'landing_pages#index'
end