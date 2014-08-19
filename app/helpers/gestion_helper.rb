module GestionHelper

  def table_for_managed_stage(inscriptions)
    simple_table_for(
     inscriptions, 
     {
       'Nom' => ->(inscription) {
         link_to(
          "<b>#{inscription.adherent.nom} #{inscription.adherent.prenom}</b>".html_safe,
          inscription, {remote: true})
       },
       'Atelier' => ->(inscription) {
         inscription.atelier.title
       }# ,
       # '_Edit' => ->(inscription) {
       #   link_to('Edit', edit_inscription_path(inscription))
       # }
     },
     {
       'data' => ->(inscription) {
         "#{inscription.adherent.nom} #{inscription.adherent.prenom}"
       }
     })
  end
  
end
