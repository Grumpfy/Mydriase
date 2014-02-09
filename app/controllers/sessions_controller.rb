class SessionsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :authorize_admin_only

  def new
  end

  def create
    # first user: register as admin 
    if User.count == 0
      first_user = User.new(:admin => true, 
                            :name => params[:name], 
                            :password => params[:password], 
                            :password_confirmation => params[:password])
      first_user.save
    end
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to gestion_url
    else
      redirect_to login_url, alert: "Utilisateur ou mot de passe incorrect"
    end
  end

  def destroy
    session[:stage_id] = nil
    session[:user_id] = nil
    redirect_to gestion_url, notice: "Logged out"
  end
end
