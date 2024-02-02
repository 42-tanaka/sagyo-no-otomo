namespace :send_line_notifications do
  desc "Send LINE notifications to users"
  task send: :environment do
    LineNotificationsController.new.send_notifications
    puts "LINE通知を送信しました"
  end
end
