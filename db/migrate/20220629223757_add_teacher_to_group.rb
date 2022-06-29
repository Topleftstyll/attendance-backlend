class AddTeacherToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_groups, :teacher_id, :integer
  end
end
