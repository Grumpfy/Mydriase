class AddMissingFieldsToInscription < ActiveRecord::Migration
  def change
    add_column :inscriptions, :conf1, :boolean, default: false
    add_column :inscriptions, :conf2, :boolean, default: false
    add_column :inscriptions, :bill_requested, :boolean, default: false
    add_column :inscriptions, :bill_delivered, :boolean, default: false
  end
end
