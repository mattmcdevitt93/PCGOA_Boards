class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :username
      t.text :content
      t.text :comment_type
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
