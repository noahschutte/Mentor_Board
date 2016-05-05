class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.integer :mentor_id, index: true
      t.integer :student_id, index: true

      t.timestamps null: false
    end
  end
end
