class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :address
      t.datetime :searched_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
