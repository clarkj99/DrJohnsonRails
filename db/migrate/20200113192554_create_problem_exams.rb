class CreateProblemExams < ActiveRecord::Migration[6.0]
  def change
    create_table :problem_exams do |t|
      t.references :encounter, null: false, foreign_key: true
      t.integer :appearance
      t.string :constitutional_details
      t.integer :psychiatric_state
      t.string :psychiatric_details
      t.boolean :abdominal_tenderness, default: false
      t.string :abdominal_details
      t.boolean :mass_detected, default: false
      t.string :mass_details
      t.integer :bowel_sounds
      t.integer :pelvic_external
      t.integer :pelvic_vaginal
      t.integer :pelvic_uteris
      t.integer :pelvic_ovaries
      t.integer :pelvic_bladder
      t.string :pelvic_details

      t.timestamps
    end
  end
end
