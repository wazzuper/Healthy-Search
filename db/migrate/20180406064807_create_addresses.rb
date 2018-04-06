class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :place
      t.float :latitude
      t.float :longitude
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
