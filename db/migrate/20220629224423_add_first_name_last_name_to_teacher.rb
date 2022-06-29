class AddFirstNameLastNameToTeacher < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_teachers, :first_name, :string
    add_column :api_v1_teachers, :last_name, :string
  end
end
