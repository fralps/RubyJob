class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Validates
  validates :company, presence: true, uniqueness: true, length: { minimum: 1 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: " : Veuillez utiliser une adresse email valide" }

  # Relation
  has_many :ads

  # Mailer methods
  def welcome_send
  	UserMailer.welcome_email(self).deliver_now
  end

  def good_bye_send
  	UserMailer.good_bye_email(self).deliver_now
  end
end
