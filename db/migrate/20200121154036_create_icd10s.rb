class CreateIcd10s < ActiveRecord::Migration[6.0]
  def change
    create_table :icd10s do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
