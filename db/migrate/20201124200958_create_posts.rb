class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :profile, foreign_key: true
      t.text :post_text
      t.text :image_url

      t.timestamps
    end
  end
end
