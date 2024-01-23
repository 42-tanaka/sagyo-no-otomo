class SessionsController < Devise::SessionsController
  def destroy
    redirect_to root_path, notice: t('.notice')
  end
end
