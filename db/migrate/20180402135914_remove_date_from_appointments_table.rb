class RemoveDateFromAppointmentsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :appointments, :date, :datetime
  end
end
