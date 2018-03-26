class AddPriceFieldForDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :price, :integer
  end
end
