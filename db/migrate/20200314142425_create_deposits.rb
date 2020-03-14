class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.string :name
      t.integer :money
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
