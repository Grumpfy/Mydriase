class Adherent < ActiveRecord::Base
  attr_accessible :adresse, :code_postal, :mail, :nom, :portable, :prenom, :remarques, :tel, :ville
end
