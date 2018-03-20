class RemoveSomeFieldsFromDoctorsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :doctors, :is_cardiologist, :boolean
    remove_column :doctors, :is_dermatologist, :boolean
    remove_column :doctors, :is_endocrinologist, :boolean
    remove_column :doctors, :is_gastroenterologist, :boolean
    remove_column :doctors, :is_oncologist, :boolean
    remove_column :doctors, :is_ophthalmologist, :boolean
    remove_column :doctors, :is_pediatrician, :boolean
    remove_column :doctors, :is_physiatrist, :boolean
  end
end
