class AddMoneyToVariableCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :variable_costs, :money, :integer
  end
end
