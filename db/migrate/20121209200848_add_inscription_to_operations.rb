class AddInscriptionToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :inscription_id, :integer
  end
end
