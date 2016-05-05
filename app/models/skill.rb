class Skill < ActiveRecord::Base
  validates :name, presence: true

  has_many :appointment_skills
  has_many :appointments, through: :appointment_skills
end
