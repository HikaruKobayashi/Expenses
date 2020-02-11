Rails.application.routes.draw do
  get 'income' => 'incomes#index'
  get 'variablecosts' => 'variable_costs#index'
  get 'fixedcosts' => 'fixed_costs#index'
end