class CreateDiagnoses < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.references :encounter, null: false, foreign_key: true
      t.text :orders
      t.text :follow_up
      t.string :icd

      t.timestamps
    end
  end
end
