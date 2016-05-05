class AppointmentSkill < ActiveRecord::Base
  validates :skill_id, presence: true

  belongs_to :appointment
  belongs_to :skill
end
