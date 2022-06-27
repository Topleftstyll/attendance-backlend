class AddGroupIdToApiV1Children < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_children, :group_id, :integer
  end
end
