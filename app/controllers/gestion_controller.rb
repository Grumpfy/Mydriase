class GestionController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :authorize_admin_only

  def index
    @managed_stage = current_stage
  end
end
