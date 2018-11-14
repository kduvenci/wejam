class AddAddressToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :address, :string
  end
end
