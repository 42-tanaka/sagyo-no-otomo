class LineNotificationsController < ApplicationController
  require 'line/bot'

  def send_notifications
    User.where(line_notifications: true).find_each do |user|
      send_line_notification(user)
    end
  end

  private

  def send_line_notification(user)
    client = Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    end

    message = {
      type: 'text',
      text: "今日のランダムピックアップを見る: https://sagyo-no-otomo-fd2222903b9e.herokuapp.com/posts/random"
    }

    response = client.push_message(user.uid, message)
    Rails.logger.info("Sent message to #{user.uid}: #{response.body}")
  end
end
