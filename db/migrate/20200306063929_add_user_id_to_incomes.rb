class AddUserIdToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :user_id, :integer
  end
end
