require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
  	before do
  		@user = FactoryGirl.create(:user)
    end
    it "can be created" do
      expect(@user).to be_valid
    end
    it "can not be created without first_name" do
      @user.first_name = nil

      expect(@user).to_not be_valid
    end
    it "can not be created without last_name" do
      @user.last_name = nil

      expect(@user).to_not be_valid
    end
    it "can not be created without phone number" do
       @user.phone = nil
      expect(@user).to_not be_valid
    end
    it 'has full_name method that combines ifrst and last name' do

    	expect(@user.full_name).to eq("SMITH, PETE")
    end
  end
end
