class AddPictureToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :picture_url, :string
  end
end
