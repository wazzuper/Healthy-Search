class AddSpecializationToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_reference :doctors, :specialization, foreign_key: true
    remove_reference :specializations, :doctor
  end
end
