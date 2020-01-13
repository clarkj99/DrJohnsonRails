class CreateHpis < ActiveRecord::Migration[6.0]
  def change
    create_table :hpis do |t|
      t.references :encounter, null: false, foreign_key: true
      t.integer :duration
      t.integer :duration_units
      t.string :location
      t.string :context
      t.integer :aggravating_factors

      t.timestamps
    end
  end
end
