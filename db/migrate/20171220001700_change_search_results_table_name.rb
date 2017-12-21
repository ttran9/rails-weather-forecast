class ChangeSearchResultsTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :search_results, :hourly_search_results
  end
end
