class AddVisitingHourToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :visiting_hour, foreign_key: true
  end
end
