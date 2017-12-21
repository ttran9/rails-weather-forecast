class ForecastsController < ApplicationController
  include SearchHelperConcern
  include GeocodeApiConcern
  include DarkskyApiConcern
  include ParseForecastHelperConcern
  include DisplayForecastsConcern

  def show_search
    @search = Search.new
    @current_page_title = "Forecast Search"
  end

  def search
    # this method performs the search and will save the search if the user is logged in.
    # if the user is not logged in it simply just redirects to a page where the user can view the results.
    search = Search.new(post_params)
    location_and_search_id = verify_search search
    perform_hourly_forecast_parse location_and_search_id
  end

  def search_result
    # this is when the user enters in a search and is shown results.
    display_forecasts
  end

  def user_searches
    if current_user
      @user_searches = Search.where(user_id: current_user.id).page(params[:page]).per(5)
    else
      redirect_to new_user_session_path, notice: 'You must be logged in to search for your prior searches.'
    end
  end

  def previous_forecasts
    if current_user && params[:search_id]
      display_previous_forecasts
    else
      redirect_to new_user_session_path, notice: 'You must be logged in to view your prior search forecasts.'
    end
  end

  private

    def post_params
      params.require(:search).permit(:address)
    end
end
