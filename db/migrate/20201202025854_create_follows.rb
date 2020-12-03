class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_foreign_key :follows, :profiles, column: 'follower'
    add_foreign_key :follows, :profiles, column: 'followed'
  end
end
