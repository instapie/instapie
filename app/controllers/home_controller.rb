class HomeController < ApplicationController
  layout 'home'

  def index
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
end
