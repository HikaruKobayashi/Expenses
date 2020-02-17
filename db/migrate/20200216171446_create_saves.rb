class CreateSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|
      t.string :name
      t.integer :money
      t.string :content

      t.timestamps
    end
  end
end
