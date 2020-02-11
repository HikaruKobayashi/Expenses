class AddMoneyToFixedCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :fixed_costs, :money, :integer
  end
end
