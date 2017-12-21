class AddFormattedTimeToHourlySearchResults < ActiveRecord::Migration[5.1]
  def change
    add_column :hourly_search_results, :formatted_time, :string
  end
end

