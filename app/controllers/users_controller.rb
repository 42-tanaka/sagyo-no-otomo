class UsersController < ApplicationController
  def update_notification_settings
    current_user.update(line_notifications: params[:line_notifications])
    redirect_to root_path, notice: 'LINE通知設定が更新されました'
  end
end
