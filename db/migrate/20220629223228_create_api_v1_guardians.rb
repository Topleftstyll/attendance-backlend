class CreateApiV1Guardians < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_guardians do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :child_id

      t.timestamps
    end
  end
end
