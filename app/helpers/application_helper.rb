module ApplicationHelper

  def connected?
    session[:user_id]
  end 

  def administrator?
    session[:admin] == true
  end

  def user_name
    session[:user_name]
  end

end
