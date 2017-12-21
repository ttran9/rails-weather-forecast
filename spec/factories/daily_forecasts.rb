FactoryBot.define do
  factory :daily_forecast do
    time "2017-12-20 02:29:57"
    formatted_time "MyString"
    summary "MyString"
    low_temperature "9.99"
    low_temperature_time "2017-12-20 02:29:57"
    low_temperature_formatted_time "MyString"
    high_temperature "9.99"
    high_temperature_time "2017-12-20 02:29:57"
    high_temperature_formatted_time "MyString"
    search
  end
end
