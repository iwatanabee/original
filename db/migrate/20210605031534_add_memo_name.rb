class AddMemoName < ActiveRecord::Migration[6.1]
  def change
    add_column :memos, :name, :string
  end
end
