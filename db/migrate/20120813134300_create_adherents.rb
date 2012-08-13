class CreateAdherents < ActiveRecord::Migration
  def change
    create_table :adherents do |t|
      t.string :nom
      t.string :prenom
      t.string :adresse
      t.integer :code_postal
      t.string :ville
      t.string :tel
      t.string :portable
      t.string :mail
      t.text :remarques

      t.timestamps
    end
  end
end
