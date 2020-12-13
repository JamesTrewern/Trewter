class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :surname, null: false
      t.date :dob, null: false
      t.text :bio

      t.timestamps
    end
  end
end
