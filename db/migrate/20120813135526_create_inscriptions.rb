class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
      t.integer :adherent_id
      t.integer :stage_id
      t.integer :attelier_id
      t.text :remarques

      t.timestamps
    end
  end
end
