class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :state
      t.string :zip
      t.integer :user_id
    end
  end
end
