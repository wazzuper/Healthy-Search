class ChangeFieldNameFromAppointmentTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :appointments, :appointment_date, :date
  end
end
