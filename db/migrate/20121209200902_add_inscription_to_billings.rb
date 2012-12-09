class AddInscriptionToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :inscription_id, :integer
  end
end
