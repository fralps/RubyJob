class Ad < ApplicationRecord
	# Friendly_id
	extend FriendlyId
  friendly_id :title, use: :slugged

	# Validates
	validates :title, presence: true, length: {maximum: 100}
	validates :location, presence: true
	validates :job_description, presence: true, length: { minimum: 50 }
	validates :profile_description, presence: true, length: { minimum: 50 }
	validates :contract, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: " : Veuillez utiliser une adresse email valide" }
	validates :salary, presence: true
	validates :experience, presence: true

	# Relation
	belongs_to :user
end
