class CreateEncounters < ActiveRecord::Migration[6.0]
  def change
    create_table :encounters do |t|
      t.integer :patient_id
      t.integer :provider_id
      # t.text :complaint
      # t.boolean :closed, :default => false
      # t.datetime :appointment_at
      # t.datetime :checkin_at

      t.timestamps
    end
  end
end
