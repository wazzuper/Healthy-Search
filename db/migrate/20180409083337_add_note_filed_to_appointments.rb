class AddNoteFiledToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :note, :text
  end
end
