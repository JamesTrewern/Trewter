class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :email, null: false
      t.text :password, null: false
      t.string :first_name, null: false
      t.string :surname, null: false
      t.date :dob
      t.text :bio
      t.string :picture_url

      t.timestamps
    end
  end
end
