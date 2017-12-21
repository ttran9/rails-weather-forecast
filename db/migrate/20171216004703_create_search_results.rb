class CreateSearchResults < ActiveRecord::Migration[5.1]
  def change
    create_table :search_results do |t|
      t.decimal :temperature
      t.string :summary
      t.datetime :time
      t.references :search, foreign_key: true

      t.timestamps
    end
  end
end
