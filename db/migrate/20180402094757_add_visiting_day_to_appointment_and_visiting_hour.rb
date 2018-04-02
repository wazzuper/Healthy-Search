class AddVisitingDayToAppointmentAndVisitingHour < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :visiting_day, foreign_key: true
    add_reference :visiting_hours, :visiting_day, foreign_key: true
  end
end
