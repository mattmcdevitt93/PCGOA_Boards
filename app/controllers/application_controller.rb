class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:username, :admin, :editor])
  end

  def admin_check
    if current_user.admin === false
      redirect_to :root
    end
  end

  def editor_check
    if current_user.editor === false
      redirect_to :root
    end
  end
end
