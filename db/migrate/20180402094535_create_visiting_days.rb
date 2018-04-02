class CreateVisitingDays < ActiveRecord::Migration[5.1]
  def change
    create_table :visiting_days do |t|
      t.date :date
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
