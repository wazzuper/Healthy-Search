class CreateVisitingHours < ActiveRecord::Migration[5.1]
  def change
    create_table :visiting_hours do |t|
      t.datetime :time
      t.references :appointment, foreign_key: true
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
