class AddUserIdToVariableCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :variable_costs, :user_id, :integer
  end
end
