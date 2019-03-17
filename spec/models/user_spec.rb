require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
  	before do
  		@user = User.create(email:"test@test.com", first_name: "Pete", last_name: "wald", password: "secret", password_confirmation: "secret")
    end
    it "can be created" do
      expect(@user).to be_valid
    end
    it "can not be created without first_name or last_name" do
      @user.first_name = nil
      @user.last_name = nil

      expect(@user).to_not be_valid
    end
  end
end
