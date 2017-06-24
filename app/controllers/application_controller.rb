class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
      if !current_user.admin?
          flash[:alert] = "你没有权限!"
          redirect_to root_path
      end
  end
end
