class InscriptionsController < ApplicationController
  skip_before_filter :authorize_admin_only, only: [:show, :index]

  # GET /inscriptions
  # GET /inscriptions.json
  def index
    @inscriptions = Inscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inscriptions }
    end
  end

  # GET /inscriptions/1
  # GET /inscriptions/1.json
  def show
    @inscription = Inscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inscription }
    end
  end

  # GET /inscriptions/new
  # GET /inscriptions/new.json
  def new
    @inscription = Inscription.new()
    # add a billing entry
    @inscription.billings.build
    # add an operation entry
    @inscription.operations.build
    
    if params[:stage_id]
      @inscription.stage_id = params[:stage_id]
    else
      @inscription.stage_id = current_stage.id
    end
    
    @inscription.adherent_id = params[:adherent_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inscription }
    end
  end

  # GET /inscriptions/1/edit
  def edit
    @inscription = Inscription.find(params[:id])
  end

  # POST /inscriptions
  # POST /inscriptions.json
  def create
    @inscription = Inscription.new(params[:inscription])

    respond_to do |format|
      if @inscription.save
        format.html { 
          redirect_to @inscription.adherent, 
          notice: "Inscription cr&eacute;e avec succ&egrave;s".html_safe }
        format.json { render json: @inscription, status: :created, location: @inscription }
      else
        format.html { render action: "new" }
        format.json { render json: @inscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inscriptions/1
  # PUT /inscriptions/1.json
  def update
    @inscription = Inscription.find(params[:id])

    respond_to do |format|
      if @inscription.update_attributes(params[:inscription])
        format.html { 
          redirect_to @inscription, 
          notice: "Inscription mise &agrave; jour avec succ&egrave;s".html_safe }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscriptions/1
  # DELETE /inscriptions/1.json
  def destroy
    @inscription = Inscription.find(params[:id])
    adherent = @inscription.adherent
    @inscription.destroy

    respond_to do |format|
      format.html { redirect_to adherent }
      format.json { head :no_content }
    end
  end
end
