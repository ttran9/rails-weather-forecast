require 'rails_helper'

RSpec.describe DailyForecast, type: :model do
  before do
    @daily_forecast = FactoryBot.create(:daily_forecast)
  end

  describe "validations" do
    it 'requires temperature (low, high, min, and max), summary, time (low temperature and high time),
        and formatted_time (for low and high temperature) fields' do
      expect(@daily_forecast).to be_valid
    end

    it 'is not valid without a low temperature field' do
      @daily_forecast.low_temperature = nil
      expect(@daily_forecast).to_not be_valid
    end
  end
end
