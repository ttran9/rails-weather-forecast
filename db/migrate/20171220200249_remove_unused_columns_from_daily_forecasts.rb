class RemoveUnusedColumnsFromDailyForecasts < ActiveRecord::Migration[5.1]
  def change
    remove_column :daily_forecasts, :min_temperature
    remove_column :daily_forecasts, :min_temperature_time
    remove_column :daily_forecasts, :min_temperature_formatted_time
    remove_column :daily_forecasts, :max_temperature
    remove_column :daily_forecasts, :max_temperature_time
    remove_column :daily_forecasts, :max_temperature_formatted_time
  end
end
