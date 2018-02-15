class AddFieldsToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :full_name, :string
    add_column :doctors, :phone_number, :string
    add_column :doctors, :address, :string
    add_column :doctors, :experience, :integer
    add_column :doctors, :is_cardiologist, :boolean
    add_column :doctors, :is_dermatologist, :boolean
    add_column :doctors, :is_endocrinologist, :boolean
    add_column :doctors, :is_gastroenterologist, :boolean
    add_column :doctors, :is_oncologist, :boolean
    add_column :doctors, :is_ophthalmologist, :boolean
    add_column :doctors, :is_pediatrician, :boolean
    add_column :doctors, :is_physiatrist, :boolean
  end
end
