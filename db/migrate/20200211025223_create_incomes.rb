class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
