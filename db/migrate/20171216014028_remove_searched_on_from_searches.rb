class RemoveSearchedOnFromSearches < ActiveRecord::Migration[5.1]
  def change
    remove_column :searches, :searched_on
  end
end
