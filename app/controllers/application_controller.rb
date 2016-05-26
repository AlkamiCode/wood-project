class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_admin?, :logged_in?, :load_cart
  before_action :load_cart

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def logged_in?
    !current_user.nil?
  end

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end
end
