class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date, null: false
      t.time, null: false

      t.timestamps null: false
    end
  end
end
