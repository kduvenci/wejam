class AddDateToJamsessions < ActiveRecord::Migration[5.2]
  def change
    add_column :jam_sessions, :date, :date
  end
end

