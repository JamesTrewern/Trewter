class AddEmailIndexToProfile < ActiveRecord::Migration[5.2]
  def change
    add_index :profiles, :email, unique: true
  end
end
