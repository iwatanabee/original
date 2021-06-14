class AddWorkspaceUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :workspaces, :user_id, :integer
    add_column :cells, :workspace_id, :integer
  end
end
