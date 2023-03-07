class CreateCrimeReporters  < ActiveRecord::Migration[7.0]
  def change
    create_table :crime_reporters do |t|
      t.string :reporter
      t.timestamps
    end
  end
end
