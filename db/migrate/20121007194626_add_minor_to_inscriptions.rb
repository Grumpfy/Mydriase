class AddMinorToInscriptions < ActiveRecord::Migration
  def change
    add_column :inscriptions, :minor, :boolean, default: false
  end
end
