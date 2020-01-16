class CreateIntakes < ActiveRecord::Migration[6.0]
  def change
    create_table :intakes do |t|
      t.references :encounter, null: false, foreign_key: true
      t.text :complaint
      t.datetime :appointment_at
      t.datetime :checkin_at
      t.integer :weight
      t.integer :height
      t.integer :bp_systolic
      t.integer :bp_diastolic

      t.timestamps
    end
  end
end
