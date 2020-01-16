class AddPhotoToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :photo, :string
  end
end
