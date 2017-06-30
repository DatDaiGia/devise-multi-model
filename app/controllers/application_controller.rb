class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for resource
    if resource.class.name == "User"
      static_pages_user_home_path
    else
      static_pages_admin_home_path
    end
  end
end
