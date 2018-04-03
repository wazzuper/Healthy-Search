class ChangeFieldTypeForAppointmentsTable < ActiveRecord::Migration[5.1]
  def change
    change_column :appointments, :date, :date
  end
end
