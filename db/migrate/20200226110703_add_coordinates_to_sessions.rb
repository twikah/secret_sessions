class AddCoordinatesToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :latitude, :float
    add_column :sessions, :longitude, :float
  end
end
