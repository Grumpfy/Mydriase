class GestionController < ApplicationController
  def index
    @managed_stage = current_stage
  end
end
