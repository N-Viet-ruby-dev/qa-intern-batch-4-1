class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :address, presence: true
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }
  validates :phone, presence: true, length: { maximum: 10 }
  validates :picture, presence: true

  before_save :downcase_email

  mount_uploader :picture, PictureUploader

  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
