class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :image
      t.boolean :eaten
      t.boolean :smell
      t.boolean :sound
      t.boolean :spill
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
