class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :role, default: "patient", null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
