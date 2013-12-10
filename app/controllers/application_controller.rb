class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # methods in ApplicationController are only available to other controllers.
  # to make current_user available to the views we use helper_method
  helper_method :current_user, :logged_in?

  def current_user
    #if there's an authenticated user, return user object
    #else return nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  # @current_user ||= introduces memoization
    #to avoid hitting the db every time current_user is called. Memoization saves the output of User.find to the instance variable @current_user

  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "Must be logged in to do that"
      redirect_to root_path
    end
  end

  def require_admin
    access_denied unless logged_in? and current_user.admin?
  end

  def access_denied
    flash[:error] = "You can't do that"
    redirect_to root_path
  end


end
