class AddLabelToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :label, :string
  end
end
