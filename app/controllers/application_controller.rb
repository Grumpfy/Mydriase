class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :authorize_admin_only
  protect_from_forgery
  
  private

  def current_stage
    Stage.find(:all, :order => "start").last
  end

  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  def authorize_admin_only
    unless User.find_by_id(session[:user_id]) and session[:admin] == true
      redirect_to login_url, notice: "Please log in as administrator"
    end
  end

end
