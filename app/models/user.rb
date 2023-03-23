class User < ApplicationRecord

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password

end
