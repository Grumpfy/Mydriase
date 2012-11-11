class AddHousingToInscriptions < ActiveRecord::Migration
  def change
    add_column :inscriptions, :room, :string, default: "" 
    add_column :inscriptions, :housing_notes, :text, default: ""
  end
end
