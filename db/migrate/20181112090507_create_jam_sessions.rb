class CreateJamSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :jam_sessions do |t|
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
