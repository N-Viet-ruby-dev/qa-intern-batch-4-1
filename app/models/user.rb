class User < ApplicationRecord
  attr_accessor :remember_token

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

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MINCOST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
