class CreateApiV1ChildGuardians < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_child_guardians do |t|
      t.integer :child_id
      t.integer :guardian_id
      
      t.timestamps
    end
  end
end
