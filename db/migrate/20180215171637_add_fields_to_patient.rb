class AddFieldsToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :full_name, :string
    add_column :patients, :phone, :string
  end
end
