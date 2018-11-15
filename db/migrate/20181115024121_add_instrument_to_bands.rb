class AddInstrumentToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :instrument, :string
  end
end
