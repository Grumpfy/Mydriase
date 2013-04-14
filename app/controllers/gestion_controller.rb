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
    @inscriptions = current_stage.inscriptions.by_name

    respond_to do |format|
      format.html 
      format.json { render json: @managed_stage }
      format.csv { export_csv(@inscriptions) }
    end
  end

protected

  def export_csv(inscriptions)
    filename = "inscriptions_"+I18n.l(Time.now, :format => :short)

    content = CSV.generate do |csv|
      # header row
      csv << ["Nom", "Prenom", "Atelier", "Mail", "Adresse", "Tel"]
      # data rows
      inscriptions.each do |inscription|
        csv << [inscription.adherent.nom, inscription.adherent.prenom, inscription.atelier.title, ]
      end
    end

    content = Iconv.conv('iso-8859-1//IGNORE', 'utf-8', content)

    send_data content,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{filename}.csv"

  end

end
