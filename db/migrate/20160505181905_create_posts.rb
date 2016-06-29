class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :username
      t.integer :user_id
      t.text :content
      t.string :post_type
      t.string :icon
      t.text :tags, array: true, default: []

      t.timestamps null: false
    end
  end
end
