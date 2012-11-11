class AddAtelierNotesToInscriptions < ActiveRecord::Migration
  def change
    add_column :inscriptions, :atelier_notes, :text, default: ""
  end
end
