class CreateMandalarts < ActiveRecord::Migration[6.1]
  def change
    create_table :mandalarts do |t|
      t.string :name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
