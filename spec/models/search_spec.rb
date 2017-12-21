require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @search = FactoryBot.create(:search)
    @ten_characters = "asdfasdfas"
  end

  describe "validations" do
    it 'requires between 10 and 70 characters' do
      @search.address = @ten_characters
      expect(@search).to be_valid
    end

    it 'requires at least 10 characters and cannot have more than 70 characters' do
      new_address = "1"
      7.times do
        new_address += @ten_characters
      end
      @search.address = new_address
      expect(@search).to_not be_valid
    end
  end

end
