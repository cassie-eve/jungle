class User < ApplicationRecord

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :password, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
