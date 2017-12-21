class RemoveTimeFromSearchResults < ActiveRecord::Migration[5.1]
  def change
    remove_column :search_results, :time
  end
end
