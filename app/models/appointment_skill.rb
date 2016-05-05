class AppointmentSkill < ActiveRecord::Base
  validates :appointment_id, :skill_id, presence: true

  belongs_to :appointment
  belongs_to :skill
end
