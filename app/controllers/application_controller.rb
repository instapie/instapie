# TODO: How do I get around having to add this?
require 'application_error'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper Cheapskate::ApplicationHelper

  helper_method :logged_in?, :current_user

  rescue_from ActiveRecord::ActiveRecordError, :with => :handle_exception
  rescue_from InstaPie::ApplicationError, :with => :handle_exception

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  protected

  def raise_error(message)
    raise InstaPie::ApplicationError.new(message)
  end

  private

  def handle_exception(exception)
    flash[:error] = exception.message
    redirect_to(request.referrer || root_path)
  end
end
