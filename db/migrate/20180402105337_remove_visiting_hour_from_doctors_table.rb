class RemoveVisitingHourFromDoctorsTable < ActiveRecord::Migration[5.1]
  def change
    remove_reference :visiting_hours, :doctor, index: true, foreign_key: true
  end
end
