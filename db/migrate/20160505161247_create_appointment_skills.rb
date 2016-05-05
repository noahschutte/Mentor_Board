class CreateAppointmentSkills < ActiveRecord::Migration
  def change
    create_table :appointment_skills do |t|
      t.integer :appointment_id, null: false
      t.integer :skill_id, null: false

      t.timestamps null: false
    end
  end
end
