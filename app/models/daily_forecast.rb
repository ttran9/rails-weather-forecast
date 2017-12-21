class DailyForecast < ApplicationRecord
  belongs_to :search

  validates_presence_of :summary, :time, :formatted_time, :low_temperature, :low_temperature_time, :low_temperature_formatted_time,
                        :high_temperature, :high_temperature_time, :high_temperature_formatted_time
end
