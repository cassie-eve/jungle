require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "created with password and password_digest fields" do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user.save
      expect(@user).to be_valid
    end
    it "doesn't create if the passwords don't match" do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '12Password', password_confirmation: '123Password')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end
end





