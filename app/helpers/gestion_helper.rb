module GestionHelper

  def table_for_managed_stage(inscriptions)
    simple_table_for(inscriptions, 
      {
        'Nom' => ->(inscription) {
          "<b>#{inscription.adherent.nom} #{inscription.adherent.prenom}</b>".html_safe
        },
        'Atelier' => ->(inscription) {
          inscription.atelier.title
        },
        'Actions' => ->(inscription) {
          show = link_to('Show', inscription)
          edit = link_to('Edit', edit_inscription_path(inscription))
          show+" "+edit
        }
      })
  end

  

end
