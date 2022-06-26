class CreateApiV1Groups < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_groups do |t|
      t.string :name
      t.integer :user_id
      t.integer :children_count
      t.string :note

      t.timestamps
    end
  end
end
