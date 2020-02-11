class AddMoneyToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :money, :integer
  end
end
