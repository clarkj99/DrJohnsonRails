class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :state
      t.string :zip
    end
  end
end
