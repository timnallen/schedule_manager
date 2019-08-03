class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :schedule, foreign_key: true
      t.integer :start_time
      t.integer :end_time
    end
  end
end
