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

  end
end





