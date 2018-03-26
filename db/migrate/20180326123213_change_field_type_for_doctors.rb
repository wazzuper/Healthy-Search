class ChangeFieldTypeForDoctors < ActiveRecord::Migration[5.1]
  def change
    change_column :doctors, :experience, 'integer USING CAST(experience AS integer)'
  end
end
