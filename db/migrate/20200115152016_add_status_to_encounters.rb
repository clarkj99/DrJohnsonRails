class AddStatusToEncounters < ActiveRecord::Migration[6.0]
  def change
    add_column :encounters, :status, :integer
  end
end
