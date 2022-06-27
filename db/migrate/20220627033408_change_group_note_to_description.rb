class ChangeGroupNoteToDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :api_v1_groups, :note, :description
    change_column :api_v1_groups, :children_count, :integer, :default => 0
  end
end
