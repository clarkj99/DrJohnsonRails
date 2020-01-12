class AddColumnsToEncounters < ActiveRecord::Migration[6.0]
  def change
    add_column :encounters, :weight, :integer
    add_column :encounters, :height, :integer
    add_column :encounters, :bp_systolic, :integer
    add_column :encounters, :bp_diastolic, :integer
  end
end
