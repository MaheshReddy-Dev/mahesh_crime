class AddContactDetailsToReporter < ActiveRecord::Migration[7.0]
  def change
    add_column :crime_reporters, :phone, :string
    add_column :crime_reporters, :email, :string
  end
end
