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
    it "email must be unique" do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user.save

      @user2 = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user2.save
      
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it "email must be included" do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", password: '123Password', password_confirmation: '123Password')
      @user.save

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "first name must be included" do
      @user = User.new(last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user.save

      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last name must be included" do
      @user = User.new(first_name: "Cassie", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user.save

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "password must be a minimum of 8 characters" do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Pass', password_confirmation: '123Pass')
      @user.save

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should pass with valid credentials' do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user.save

      @user = User.authenticate_with_credentials('cass@gmail.com', '123Password')
      expect(@user).not_to be_nil
    end
    it 'should be nil with invalid credentials' do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user.save

      @user = User.authenticate_with_credentials('cass@gmail.com', '12Password')
      expect(@user).to be_nil
    end
    it 'should authenticate email without being case sensitive' do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user.save

      @user = User.authenticate_with_credentials('CASS@GMAIL.com', '123Password')
      expect(@user).not_to be_nil
    end
    it 'should authenticate email with additional spacing around email' do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_confirmation: '123Password')
      @user.save

      @user = User.authenticate_with_credentials('  cass@gmail.com  ', '123Password')
      expect(@user).not_to be_nil
    end
  end
end





