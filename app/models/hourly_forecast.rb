class HourlyForecast < ApplicationRecord
  belongs_to :search

  validates_presence_of :temperature, :summary, :time, :formatted_time
end
