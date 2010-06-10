class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?, :login_required, :admin?, :admin_required

protected
  def current_user=(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find_by_id session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def login_required
    if not logged_in?
      redirect_to login_path
    end
  end

  def admin?
    current_user.try(:admin?)
  end

  def admin_required
    unless admin?
      action_forbidden_message
      redirect_to root_path
    end
  end

  def action_forbidden_message
    flash[:notice] = "Hier geht's für dich nicht weiter!"
  end
end
