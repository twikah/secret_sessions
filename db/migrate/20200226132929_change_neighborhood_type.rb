class ChangeNeighborhoodType < ActiveRecord::Migration[5.2]
  def change
    change_column :sessions, :neighborhood, :string
  end
end
