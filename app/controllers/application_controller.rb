class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  def configure_permitted_parameters
    # sign_inのときに、group_keyも許可する
    devise_parameter_sanitizer.for(:sign_in) << :team_name
    # sign_upのときに、group_keyも許可する
    devise_parameter_sanitizer.for(:sign_up) << :team_name
    #account_updateのときに、group_keyも許可する
    devise_parameter_sanitizer.for(:account_update) << :team_name
    # sign_upのときに、nameも許可する
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
