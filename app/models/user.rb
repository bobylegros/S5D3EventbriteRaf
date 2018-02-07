class User < ApplicationRecord
  has_and_belongs_to_many :events

  # before_save { self.email = email.downcase }

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
                    # format: { with: VALID_EMAIL_REGEX },
                    # uniqueness: { case_sensitive: false }
  # validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  has_secure_password
  # validates :password, presence: true, length: { minimum: 6 }

end
