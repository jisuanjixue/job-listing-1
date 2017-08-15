class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

   protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :is_female, :date_of_birth) }
      end

  def admin_required
      if !current_user.admin?
          flash[:alert] = "你没有权限!"
          redirect_to root_path
      end
  end
end
