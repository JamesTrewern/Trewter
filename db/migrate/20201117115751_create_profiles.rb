class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :email
      t.text :password
      t.string :first_name
      t.string :surname
      t.date :dob
      t.text :bio
      t.string :picture_url

      t.timestamps
    end
  end
end
