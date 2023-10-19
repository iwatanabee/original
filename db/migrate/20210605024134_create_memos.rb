class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.string :name
      t.string :body
      t.timestamps null: false
    end
  end
end
