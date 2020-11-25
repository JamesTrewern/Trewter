class AddUserToProfile < ActiveRecord::Migration[5.2]
  def up
    add_reference :profiles, :user, index: true
    Profile.reset_column_information
    user = User.first

    Profile.all.each do |profile|
      profile.user_id = user.id
      profile.save!
    end

    change_column_null :profiles, :user_id, false
    add_foreign_key :profiles, :users
  end

  def down
    remove_foreign_key :profiles, :users
    remove_reference :profiles, :user, index: true
  end
end
