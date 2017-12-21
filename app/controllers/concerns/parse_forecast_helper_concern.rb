module ParseForecastHelperConcern
  extend ActiveSupport::Concern

  def perform_hourly_forecast_parse location_and_search_id
    if location_and_search_id
      if location_and_search_id.length == 3
        parse_hourly_forecast_results_and_save location_and_search_id
      elsif location_and_search_id.length == 2
        parse_hourly_forecast_results_and_save location_and_search_id
      end
    else
      redirect_to root_path, notice: 'Could not get a forecast for the entered address.'
    end
  end

  def parse_hourly_forecast_results_and_save location_and_search_id
    parse_forecast_results location_and_search_id[0], location_and_search_id[1], location_and_search_id[2]
    redirect_to forecasts_search_result_path(
                    lat: location_and_search_id[0],
                    lng: location_and_search_id[1])
  end

  def parse_hourly_forecast_results location_and_search_id
    parse_forecast_results location_and_search_id[0], location_and_search_id[1]
    redirect_to forecasts_search_result_path(
                    lat: location_and_search_id[0],
                    lng: location_and_search_id[1])
  end

end
