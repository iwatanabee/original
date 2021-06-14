class CreateCells < ActiveRecord::Migration[6.1]
  def change
    create_table :cells do |t|
      t.string :body11
      t.string :body12
      t.string :body13
      t.timestamps null: false
    end
  end
end
