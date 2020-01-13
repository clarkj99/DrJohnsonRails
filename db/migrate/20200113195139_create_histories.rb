class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :user, foreign_key: true
      t.boolean :pregnancy, default: false
      t.boolean :hypertension, default: false
      t.boolean :high_bp, default: false
      t.boolean :cancer, default: false
      t.boolean :breast_lump, default: false
      t.boolean :heart_disease, default: false
      t.boolean :abnormal_ekg, default: false
      t.boolean :depression, default: false
      t.boolean :diabetes1, default: false
      t.boolean :diabetes2, default: false
      t.boolean :infertility, default: false
      t.boolean :mental_illness, default: false
      t.boolean :post_menopausal_bleeding, default: false
      t.boolean :seizures, default: false
      t.boolean :migraines, default: false

      t.timestamps
    end
  end
end
