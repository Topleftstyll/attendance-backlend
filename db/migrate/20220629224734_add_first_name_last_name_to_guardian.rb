class AddFirstNameLastNameToGuardian < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_guardians, :first_name, :string
    add_column :api_v1_guardians, :last_name, :string
  end
end
