class Mentor < User
  has_many :appointments
  has_many :reviews
end
