class AteliersController < ApplicationController
  # GET /ateliers
  # GET /ateliers.json
  def index
    @ateliers = Atelier.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ateliers }
    end
  end

  # GET /ateliers/1
  # GET /ateliers/1.json
  def show
    @atelier = Atelier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atelier }
    end
  end

  # GET /ateliers/new
  # GET /ateliers/new.json
  def new
    @atelier = Atelier.new
    if params[:stage_id]
      @atelier.stage_id = params[:stage_id]
    else
      @atelier.stage_id = current_stage.id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atelier }
    end
  end

  # GET /ateliers/1/edit
  def edit
    @atelier = Atelier.find(params[:id])
  end

  # POST /ateliers
  # POST /ateliers.json
  def create
    @atelier = Atelier.new(params[:atelier])

    respond_to do |format|
      if @atelier.save
        format.html { redirect_to @atelier.stage, notice: 'Atelier was successfully created.' }
        format.json { render json: @atelier, status: :created, location: @atelier }
      else
        format.html { render action: "new" }
        format.json { render json: @atelier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ateliers/1
  # PUT /ateliers/1.json
  def update
    @atelier = Atelier.find(params[:id])

    respond_to do |format|
      if @atelier.update_attributes(params[:atelier])
        format.html { redirect_to @atelier, notice: 'Atelier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atelier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ateliers/1
  # DELETE /ateliers/1.json
  def destroy
    @atelier = Atelier.find(params[:id])
    @atelier.destroy

    respond_to do |format|
      format.html { redirect_to ateliers_url }
      format.json { head :no_content }
    end
  end
end
