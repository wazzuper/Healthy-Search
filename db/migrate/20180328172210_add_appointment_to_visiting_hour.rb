class AddAppointmentToVisitingHour < ActiveRecord::Migration[5.1]
  def change
    add_reference :visiting_hours, :appointment, foreign_key: true
  end
end
