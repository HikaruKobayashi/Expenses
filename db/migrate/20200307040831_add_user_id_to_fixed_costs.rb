class AddUserIdToFixedCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :fixed_costs, :user_id, :integer
  end
end
