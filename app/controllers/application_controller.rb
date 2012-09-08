class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :authorize_admin_only
  protect_from_forgery
  helper_method :current_user

  private

  def current_stage
    Stage.find(:all, :order => "start").last
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      session[:user_id] = nil
      redirect_to login_url, notice: "Connection requise"
    end
  end

  def authorize_admin_only
    admin_user = User.where("id = ? AND admin = ?", session[:user_id], true).last
    unless admin_user 
      redirect_to login_url, notice: "Connection en tant qu'administrateur requise"
    end
  end

end
