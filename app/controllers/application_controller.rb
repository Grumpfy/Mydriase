class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_stage
    Stage.find(:all, :order => "start").last
  end

end
