class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def new_session_path(scope)
    new_user_session_path
  end

  def current_user? user
    current_user == user
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :phone]
  end

  def verify_admin
    
  end
end
