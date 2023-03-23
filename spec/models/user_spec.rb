require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "created with password and password_digest fields" do
      @user = User.new(first_name: "Cassie", last_name: "Keddis", email: "cass@gmail.com", password: '123Password', password_digest: '123Password')
      expect(@user).to be_valid
    end

  end
end





