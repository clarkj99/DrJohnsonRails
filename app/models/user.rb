class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #Minimum eight characters, at least one uppercase letter, one lowercase letter and one number
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}/

  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase }
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "must be minimum eight characters, at least one uppercase letter, one lowercase letter, and one number" }
  enum role: [:patient, :assistant, :practitioner, :physician, :admin]

  has_many :doctor_visits, foreign_key: "patient_id", class_name: "Encounter"
  has_many :patient_exams, foreign_key: "provider_id", class_name: "Encounter"
end
