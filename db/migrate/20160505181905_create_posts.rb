class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :username
      t.text :content
      t.string :post_type
      t.string :icon

      t.timestamps null: false
    end
  end
end
