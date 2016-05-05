class Review < ActiveRecord::Base
  validates :rating, :content, :author_id, :appointment_id, presence: true

  belongs_to :appointment
  belongs_to :author, class_name: "User", foreign_key: :author_id
end
