module DisplayForecastsConcern
  extend ActiveSupport::Concern

  def display_forecasts
    if params[:lat] && params[:lng]
      @result = parse_forecast_results params[:lat], params[:lng]

      @forecast_variables = {} # hash to hold other necessary instance variables.
      forecast_flag = "hourly"
      @forecast_variables[:forecast_flag] = forecast_flag

      display_forecasts_from_search
    end
  end

  def display_forecasts_from_search
    # returns back content with the daily or hourly forecast.
    hourly_forecast = @result[:hourly_forecast]
    if params[:type]
      forecast_type = params[:type]
      if forecast_type == "daily"
        @forecast_variables[:forecast_flag] = forecast_type # if it is not the default value make it into a "daily" type
        daily_forecast_low_temps = @result[:daily_forecast_low_temperatures]
        daily_forecast_high_temps = @result[:daily_forecast_high_temperatures]
        @forecast_variables[:paginatable_daily_forecast_low_temps] = Kaminari.paginate_array(daily_forecast_low_temps).page(params[:page]).per(5)
        @forecast_variables[:paginatable_daily_forecast_high_temps] = Kaminari.paginate_array(daily_forecast_high_temps).page(params[:page]).per(5)
      else
        @forecast_variables[:paginatable_hourly_forecast] = Kaminari.paginate_array(hourly_forecast).page(params[:page]).per(5)
      end
    else
      @forecast_variables[:paginatable_hourly_forecast] = Kaminari.paginate_array(hourly_forecast).page(params[:page]).per(5)
    end
  end

  def display_previous_forecasts
    search = Search.find(params[:search_id])
    if current_user.id == search.user_id # check to ensure this user is the user that created the search to view it.
      @previous_forecasts = {}
      @previous_forecasts[:address] = search.address # assign in here only if the user has been properly authenticated.
      @previous_forecasts[:search_id] = search.id
      if params[:type]
        if params[:type] == "daily"
          fill_with_daily_forecasts
        else
          fill_with_hourly_forecasts
        end
      else
        fill_with_hourly_forecasts
      end
    else
      redirect_to new_user_session_path, notice: 'You must be the user who made the search to view it.'
    end
  end

  def fill_with_hourly_forecasts
    hourly_forecasts = HourlyForecast.where(search_id: params[:search_id]).order(time: :asc).page(params[:page]).per(5)
    if hourly_forecasts.length > 0
      @previous_forecasts[:hourly_forecasts] = hourly_forecasts
    end
  end

  def fill_with_daily_forecasts
    daily_forecasts = DailyForecast.where(search_id: params[:search_id]).order(time: :asc).page(params[:page]).per(5)
    if daily_forecasts.length > 0
      @previous_forecasts[:daily_forecasts] = daily_forecasts
    end
  end
end