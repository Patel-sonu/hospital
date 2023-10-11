class Doctor < ApplicationRecord
	include ActiveModel::SecurePassword
	# has_secure_password

	# def self.authenticate(email, password)
  #   doctor = find_by(email: email)
  #   return doctor if doctor && doctor.authenticate(password)
	# end

	 # validates :email, presence: true, uniqueness: true
  # 	validates :password, presence: true

	has_many :appointments
	has_many :patient, through: :appointments

end
