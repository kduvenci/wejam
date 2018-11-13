class AddDateToJamsessions < ActiveRecord::Migration[5.2]
  def change
    add_column :jamsessions, :date, :date
  end
end
