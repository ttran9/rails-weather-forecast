require 'rails_helper'

RSpec.describe HourlyForecast, type: :model do
  before do
    @hourly_forecast = FactoryBot.create(:hourly_forecast)
  end

  describe "validations" do
    it 'requires temperature, summary, time, and formatted_time fields' do
      expect(@hourly_forecast).to be_valid
    end

    it 'is not valid without a temperature field' do
      @hourly_forecast.temperature = nil
      expect(@hourly_forecast).to_not be_valid
    end
  end


end
