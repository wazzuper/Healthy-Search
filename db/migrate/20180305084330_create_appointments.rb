class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.belongs_to :doctor, index: true
      t.belongs_to :patient, index: true

      t.timestamps
    end
  end
end
