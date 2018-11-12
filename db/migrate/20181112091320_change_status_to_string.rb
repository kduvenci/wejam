class ChangeStatusToString < ActiveRecord::Migration[5.2]
  def change
    change_column :jam_sessions, :status, :string
  end
end
