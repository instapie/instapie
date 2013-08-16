class HomeController < ApplicationController
  force_ssl({
    :if     => :ssl_available?,
    :only   => [:login, :register],
    :domain => Cheapskate::CONFIG['HTTPS_HOST']
  })

  layout :layout_for_user

  def index
    @questions = Question.latest(30)
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

  def ssl_available?
    Rails.env.production?
  end

  def layout_for_user
    logged_in? && 'application' || 'home'
  end
end
