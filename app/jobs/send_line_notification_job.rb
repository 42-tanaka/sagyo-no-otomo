require 'line/bot'

class SendLineNotificationJob < ApplicationJob
  queue_as :default

  def perform
    User.where(receive_line_notifications: true).find_each do |user|
      send_line_notification(user)
    end
  end

  private

  def send_line_notification(user)
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }

    message = {
      type: 'text',
      text: "今日のランダムピックアップ: https://sagyo-no-otomo-fd2222903b9e.herokuapp.com/posts/random"
    }

    client.push_message(user.uid, message)
  end
end
