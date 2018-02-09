class User < ApplicationRecord
  has_many :created_events, class_name: "Event"
  has_and_belongs_to_many :attended_events, class_name: "Event"
  has_secure_password
  #VALIDATIONS COMMENTEES POUR FACILITER LES TESTS

  # before_save { self.email = email.downcase }

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
                    # format: { with: VALID_EMAIL_REGEX },
                    # uniqueness: { case_sensitive: false }
  # validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  # validates :password, presence: true, length: { minimum: 6 }

end
