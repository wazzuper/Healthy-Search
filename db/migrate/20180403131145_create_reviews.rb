class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :patient
      t.references :doctor
      t.references :appointment

      t.timestamps
    end
  end
end
