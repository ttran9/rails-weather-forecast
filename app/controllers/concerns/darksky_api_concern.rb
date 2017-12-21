module DarkskyApiConcern
  extend ActiveSupport::Concern

  def get_forecast(lat, lng)

    # TODO: Add in an exclude argument into the link below and only filter for currently, hourly, and daily
    dark_sky_api_key = ENV['DARK_SKY_KEY']
    dark_sky_request_url = "https://api.darksky.net/forecast/#{dark_sky_api_key}/#{lat},#{lng}?exclude=minutely,flags"
    url = URI(dark_sky_request_url)
    Net::HTTP.get(url) # make the request and return the json body contents
  end

  def parse_forecast_results(lat, lng, search_id = nil)
    # populate a hash which holds both the hourly and daily forecast contents.
    results = get_forecast lat, lng
    json = JSON.parse(results)

    forecast = {hourly_summary: json["hourly"]["summary"], daily_summary: json["daily"]["summary"]}

    hourly_forecast = fill_hourly_array json, search_id

    daily_forecast = fill_daily_content json, search_id

    forecast[:hourly_forecast] = hourly_forecast
    forecast[:daily_forecast_low_temperatures] = daily_forecast[:daily_forecast_low_temperatures]
    forecast[:daily_forecast_high_temperatures] = daily_forecast[:daily_forecast_high_temperatures]
    forecast
  end

  def fill_hourly_array(json, search_id)
    hourly_forecast_array = []
    json["hourly"]["data"].each do |hourly_data|
      hf_time = Time.at(hourly_data["time"]).to_datetime
      hourly_forecast = HourlyForecast.new(time: hf_time,
                              summary: hourly_data["summary"],
                              temperature: hourly_data["temperature"],
                              formatted_time: datetime_to_formatted_string(hf_time))
      save_hourly_forecast_content hourly_forecast, search_id if search_id
      hourly_forecast_array.append([hourly_forecast.formatted_time, hourly_forecast.temperature])
    end
    hourly_forecast_array
  end

  def save_hourly_forecast_content(hourly_forecast, search_id)
    if current_user
      hourly_forecast.search_id = search_id
      if hourly_forecast.validate
        hourly_forecast.save!
      end
    end
  end

  def fill_daily_content(json, search_id)
    daily_forecast_content = []
    json["daily"]["data"].each do |daily_data|
      df_time = Time.at(daily_data["time"]).to_datetime
      low_temperature_time = Time.at(daily_data["temperatureLowTime"]).to_datetime
      high_temperature_time = Time.at(daily_data["temperatureHighTime"]).to_datetime
      daily_forecast = DailyForecast.new(time: df_time,
                                         formatted_time: datetime_to_formatted_string(df_time),
                                         summary: daily_data["summary"],
                                         low_temperature: daily_data["temperatureLow"],
                                         low_temperature_time: low_temperature_time,
                                         low_temperature_formatted_time: datetime_to_formatted_string(low_temperature_time),
                                         high_temperature: daily_data["temperatureHigh"],
                                         high_temperature_time: high_temperature_time,
                                         high_temperature_formatted_time: datetime_to_formatted_string(high_temperature_time))
      save_daily_forecast_content daily_forecast, search_id if search_id
      daily_forecast_content.append(daily_forecast)
    end
    # store both daily forecast contents into the hash.
    fill_daily_forecast_content daily_forecast_content
  end

  def save_daily_forecast_content(daily_forecast, search_id)
    if current_user
      daily_forecast.search_id = search_id
      if daily_forecast.validate
        daily_forecast.save!
      end
    end
  end

  def fill_daily_forecast_content daily_forecast_content
    daily_content = {}
    daily_forecast_low_temperatures = []
    daily_forecast_high_temperatures = []
    daily_forecast_content.each do |daily_forecast_data|
      daily_forecast_low_temperatures.append([daily_forecast_data.low_temperature_formatted_time, daily_forecast_data.low_temperature])
      daily_forecast_high_temperatures.append([daily_forecast_data.high_temperature_formatted_time, daily_forecast_data.high_temperature])
    end

    daily_content[:daily_forecast_low_temperatures] = daily_forecast_low_temperatures
    daily_content[:daily_forecast_high_temperatures] = daily_forecast_high_temperatures
    daily_content
  end

  def datetime_to_formatted_string datetime
    datetime.in_time_zone.strftime("%b %e %Y at %l:%M %p %Z")
  end


end