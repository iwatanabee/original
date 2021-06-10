class CreateCells < ActiveRecord::Migration[6.1]
  def change
    create_table :cells do |t|
      t.string :body
      t.integer :x
      t.integer :y
      t.timestamps null: false
    end
  end
end
