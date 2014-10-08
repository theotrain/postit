class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :logged_in_as_creator?

  def logged_in?
    !!current_user
  end

  def current_user
    # if theres an authenticated user, return user object else nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !logged_in?
      flash[:error] = 'Must be logged in to do that.'
      redirect_to root_path
    end
  end

  def logged_in_as_creator?(obj)
    logged_in? && (current_user.id == obj.user_id)
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You can't perform that action."
      redirect_to root_path
    end
  end

end
