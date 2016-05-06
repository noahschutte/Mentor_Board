class User < ActiveRecord::Base
  has_secure_password

  mount_uploader :image, ImageUploader
  validates :first_name, :last_name, :email, :phone, :phase, :type, presence: true
  validates :email, uniqueness: true
end
