class AddTimeToSearchResults < ActiveRecord::Migration[5.1]
  def change
    add_column :search_results, :time, :datetime
  end
end
