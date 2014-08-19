module AdherentsHelper

  def table_for_adherents(adherents)
    simple_table_for(
     adherents, 
     {
       'Nom' => ->(adherent) {
         link_to(
          "<b>#{adherent.nom} #{adherent.prenom}</b>".html_safe,
          adherent, {remote: true})
       },
       'Ville' => ->(adherent) {
          "#{adherent.ville}".html_safe
       },
       '_Destroy' => ->(adherent) {
         link_to('Destroy', adherent, method: :delete, data: { confirm: 'Are you sure?' })
       }
     },
     {
       'data' => ->(adherent) {
         "#{adherent.nom} #{adherent.prenom}"
       }
     })
  end

end
