class Appointment < ActiveRecord::Base
  validates :date, :time, presence: true
end
