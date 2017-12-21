class Search < ApplicationRecord
  has_many :hourly_forecasts
  has_many :daily_forecasts
  belongs_to :user, optional: true

  validates_length_of :address, :in => 10..70
end
