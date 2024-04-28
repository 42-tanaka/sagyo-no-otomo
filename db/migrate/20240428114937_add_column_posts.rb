class AddColumnPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :hands_dirty, :boolean
  end
end
