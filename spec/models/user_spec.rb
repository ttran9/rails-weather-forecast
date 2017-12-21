require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "verifying validations" do
    it "cannot be created without an email address" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "requires a password to be at least 6 characters" do
      @user.password = "asdfa"
      expect(@user).to_not be_valid
    end
  end
end
