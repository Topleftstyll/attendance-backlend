class CreateApiV1Teachers < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_teachers do |t|
      t.string :name
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
