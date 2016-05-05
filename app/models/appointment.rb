class Appointment < ActiveRecord::Base
  validates :datetime, presence: true

  has_many :reviews
  has_many :appointment_skills
  has_many :skills, through: :appointment_skills
  belongs_to :student, class_name: "User", foreign_key: :student_id
  belongs_to :mentor, class_name: "User", foreign_key: :mentor_id
end
