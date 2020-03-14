class Records < ActiveRecord::Migration[5.2]
  def change
    drop_table :assets
    drop_table :saves
  end
end
