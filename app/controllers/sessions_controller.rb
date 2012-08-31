class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      session[:admin] = user.admin
      redirect_to gestion_url
    else
      redirect_to login_url, alert: "Utilisateur ou mot de passe incorrect"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    session[:admin] = nil
    redirect_to gestion_url, notice: "Logged out"
  end
end
