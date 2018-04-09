class AddActiveFieldToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :active, :boolean
  end
end
