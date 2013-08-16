class HomeController < ApplicationController
  layout :layout_for_user

  include ApplicationHelper

  def index
    @questions = Question.latest(30)
  end

  def login
    if request.post?
      user = User.find_by_email(params[:email])

      if user.nil?
        flash[:error] = 'That user does not exist.'
        return redirect_to(https_url('login'))
      end

      if !user.authenticate(params[:password])
        flash[:error] = 'You have entered an incorrect password.'
        return redirect_to(https_url('login'))
      end

      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to(http_url('root'))
    end
  end

  def register
    if request.post?
      user = User.create!(user_params)

      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to(http_url('root'))
    end
  end

  def logout
    session.delete(:user_id)
    flash[:notice] = 'Successfully logged out.'
    redirect_to(root_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def layout_for_user
    logged_in? && 'application' || 'home'
  end
end
