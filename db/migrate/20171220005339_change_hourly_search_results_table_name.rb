class ChangeHourlySearchResultsTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :hourly_search_results, :hourly_forecasts
  end
end
