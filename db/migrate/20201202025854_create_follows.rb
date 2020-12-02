class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.belongs_to :follower, class_name: "Profile",  foreign_key: true
      t.belongs_to :followed, class_name: "Profile", foreign_key: true

      t.timestamps
    end
  end
end
