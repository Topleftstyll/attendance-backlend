class CreateApiV1Children < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :teacher_id
      t.integer :attendance_id

      t.timestamps
    end
  end
end
