class AddHiddenToInscriptions < ActiveRecord::Migration
  def change
    add_column :inscriptions, :hidden, :boolean, default: false
  end
end
