require 'csv'
require 'iconv'

class GestionController < ApplicationController
  skip_before_filter :authorize, :only => [:overview]
  skip_before_filter :authorize_admin_only

  def overview
    @managed_stage = current_stage
  end

  def managed_stage  
    @managed_stage = current_stage

    if params[:conf_level] and params[:conf_level] == "1"
      @inscriptions = current_stage.inscriptions.pending_conf1.by_name
      @filter_conf = :conf1
      csv_base_name = "attente_conf1"
    elsif params[:conf_level] and params[:conf_level] == "2" 
      @inscriptions = current_stage.inscriptions.pending_conf2.by_name
      @filter_conf = :conf2
      csv_base_name = "attente_conf2"
    else
      @inscriptions = current_stage.inscriptions.by_name
      @filter_conf = :none
      csv_base_name = "inscriptions"
    end

    respond_to do |format|
      format.html 
      format.json { render json: @managed_stage }
      format.csv { export_csv(@inscriptions, csv_base_name) }
    end
  end

  def bulk_bump_confirmation_state
    if params[:conf_level] and params[:conf_level] == "1"
      current_stage.inscriptions.pending_conf1.update_all(:conf1 => true)
    elsif params[:conf_level] and params[:conf_level] == "2" 
      current_stage.inscriptions.pending_conf2.update_all(:conf2 => true)
    end

    redirect_to managed_stage_url
  end

protected

  def export_csv(inscriptions, csv_base_name)
    filename = csv_base_name+"_"+I18n.l(Time.now, :format => :short)

    content = CSV.generate(:col_sep => "\t") do |csv|
      # header row
      csv << 
        ["Nom", "Prenom", "Atelier", 
         "Mail", 
         "Adresse", "Ville", "Code Postal",
         "Tel", "Portable",
         "Confirmation 1", "Confirmation 2"]
      # data rows
      inscriptions.each do |inscription|
        csv << 
          [inscription.adherent.nom, inscription.adherent.prenom, inscription.atelier.title, 
           inscription.adherent.mail, 
           inscription.adherent.adresse, inscription.adherent.ville, inscription.adherent.code_postal,
           inscription.adherent.tel, inscription.adherent.portable,
           inscription.conf1, inscription.conf2]
      end
    end

    content = Iconv.conv('iso-8859-1//IGNORE', 'utf-8', content)

    send_data content,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{filename}.csv"

  end

end
