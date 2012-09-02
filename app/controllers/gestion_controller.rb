class GestionController < ApplicationController
  skip_before_filter :authorize

  def index
    @managed_stage = current_stage
  end
end
