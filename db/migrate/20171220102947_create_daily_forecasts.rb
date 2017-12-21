class CreateDailyForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_forecasts do |t|
      t.datetime :time
      t.string :formatted_time
      t.string :summary
      t.decimal :low_temperature
      t.datetime :low_temperature_time
      t.string :low_temperature_formatted_time
      t.decimal :high_temperature
      t.datetime :high_temperature_time
      t.string :high_temperature_formatted_time
      t.decimal :min_temperature
      t.datetime :min_temperature_time
      t.string :min_temperature_formatted_time
      t.decimal :max_temperature
      t.datetime :max_temperature_time
      t.string :max_temperature_formatted_time
      t.references :search, foreign_key: true

      t.timestamps
    end
  end
end
