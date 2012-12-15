class GestionController < ApplicationController
  skip_before_filter :authorize, :only => [:overview]
  skip_before_filter :authorize_admin_only

  def overview
    @managed_stage = current_stage
  end

  def managed_stage  
    @managed_stage = current_stage
  end

end
