class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, :set_current_user

  before_filter :force_redirect

  def after_sign_in_path_for(resource)
    #hey_wait
    unless resource.has_role?
      user_set_user_type_path(resource)
    else
      users_dashboard_path(resource)
    end
  end

  def force_redirect
    redirect_to user_set_user_type_path(current_user) if current_user &&
    !(current_user.has_role?) &&
    request.params[:action] != "set_user_type" &&
    !(devise_controller?) &&
    request.params[:action] != "new" &&
    request.params[:action] != "create"
  end



  private

  def set_current_user
    Ngo.current = current_user
  end

end
