require 'csv'
require 'iconv'

class GestionController < ApplicationController
  skip_before_filter :authorize, :only => [:overview]
  skip_before_filter :authorize_admin_only, only: [:overview, :managed_stage]

  def overview
    @managed_stage = current_stage
  end

  def managed_stage  
    @managed_stage = current_stage

    if params[:filter] and params[:filter] == "conf1"
      @inscriptions = current_stage.inscriptions.pending_conf1.visible.by_name
      csv_base_name = "attente_conf1"
    elsif params[:filter] and params[:filter] == "conf2" 
      @inscriptions = current_stage.inscriptions.pending_conf2.visible.by_name
      csv_base_name = "attente_conf2"
    elsif params[:filter] and params[:filter] == "hidden" 
      @inscriptions = current_stage.inscriptions.hidden.by_name
      csv_base_name = "hidden"
    else
      @inscriptions = current_stage.inscriptions.visible.by_name
      csv_base_name = "inscriptions"
    end

    filename = csv_base_name+"_"+I18n.l(Time.now, :format => :short)

    respond_to do |format|
      format.html 
      format.json { render json: @managed_stage }
      format.csv { export_csv(@inscriptions, filename) }
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" }
    end
  end

  def bulk_bump_confirmation_state
    if params[:filter] and params[:filter] == "conf1"
      current_stage.inscriptions.pending_conf1.update_all(:conf1 => true)
    elsif params[:filter] and params[:filter] == "conf2" 
      current_stage.inscriptions.pending_conf2.update_all(:conf2 => true)
    end

    redirect_to managed_stage_url
  end

protected

  def escape(s)
    s.gsub("\r", "").gsub("\n", " / ")
  end

  def export_csv(inscriptions, filename)
    content = CSV.generate(:col_sep => "\t") do |csv|
      # header row
      csv << 
        ["Nom", "Prenom", "Atelier", 
         "Mail", 
         "Adresse", "Ville", "Code Postal",
         "Tel", "Portable",
         "Confirmation 1", "Confirmation 2", "Mineur", "Vegan",
         "Remarque globale", 
         "Remarque altelier", 
         "Remarque alimentation", 
         "Remarque adherent",
         "Remarque hebergement",
         "Chambre", "Solde"]
      # data rows
      inscriptions.each do |inscription|
        i = InscriptionStatus.new(inscription, nil)
        csv << 
          [i.adherent_last_name, i.adherent_first_name, i.atelier_title, 
           i.adherent_mail, 
           escape(i.adherent_address), i.adherent_city, i.adherent_postal,
           i.adherent_tel, i.adherent_mobile,
           i.conf1, i.conf2, i.minor, i.vegetarian,
           escape(i.remarque(:global)), 
           escape(i.remarque(:atelier)), 
           escape(i.remarque(:food)), 
           escape(i.remarque(:adherent)),
           escape(i.remarque(:housing)),
           i.room, i.solde]
      end
    end

    # encoding = 'iso-8859-1' 
    # encoding = 'utf-16le' 
    # bom = "\xFF\xFE"
    encoding = 'utf-8' 
    # bom = "\xEF\xBB\xBF"

    content = Iconv.conv("#{encoding}//IGNORE", 'utf-8', content)

    send_data content,
    :type => "text/csv; charset=#{encoding}; header=present",
    :disposition => "attachment; filename=#{filename}.txt"

  end

end
