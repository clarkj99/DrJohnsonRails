class CreateRosystems < ActiveRecord::Migration[6.0]
  def change
    create_table :rosystems do |t|
      t.references :encounter, null: false, foreign_key: true
      t.boolean :fever, default: false
      t.boolean :fatigue, default: false
      t.boolean :appetite, default: false
      t.boolean :weight, default: false
      t.string :constitutional_details
      t.boolean :depression, default: false
      t.boolean :anxiety, default: false
      t.string :psychiatric_details
      t.boolean :trouble_swallowing, default: false
      t.boolean :heartburn, default: false
      t.boolean :nausea, default: false
      t.boolean :vomiting, default: false
      t.boolean :irregular_bm, default: false
      t.string :gastrointestinal_details
      t.boolean :trouble_urinating, default: false
      t.boolean :abnormal_bleeding, default: false
      t.boolean :vaginal_discharge, default: false
      t.string :genital_urinary_description
      t.boolean :joint_pain, default: false
      t.boolean :joint_swelling, default: false
      t.string :musculoskeletal_details

      t.timestamps
    end
  end
end
