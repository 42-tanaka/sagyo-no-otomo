class AddLineNotificationsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :line_notifications, :boolean, default: false
  end
end
