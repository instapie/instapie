class HomeController < ApplicationController
  layout :layout_for_user

  def index
    @questions = Question.latest
  end

  def login
  end

  def register
  end

  def logout
    session.delete(:user_id)
    flash[:notice] = 'Successfully logged out.'
    redirect_to(root_path)
  end

  private

  def layout_for_user
    logged_in? && 'application' || 'home'
  end
end
