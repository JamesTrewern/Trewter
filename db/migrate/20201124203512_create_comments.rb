class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :post, foreign_key: true
      t.belongs_to :profile, foreign_key: true
      t.text :comment_text, null: false

      t.timestamps
    end
  end
end
