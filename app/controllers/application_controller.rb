class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :destroy, :create, :edit, :update]


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path # ←redirect先にしたいpathを自分で書く
  end

  def require_login
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end
end
